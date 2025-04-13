# استخدام iOS 13.0 كحد أدنى
platform :ios, '11.0'

# تعطيل إحصائيات CocoaPods
ENV['COCOAPODS_DISABLE_STATS'] = 'true'

# إعداد المشروع مع جميع البيئات: Debug, Profile, Release
project 'Runner', {
  'Debug' => :debug,
  'Profile' => :release,
  'Release' => :release,
}

# دالة العثور على FLUTTER_ROOT
def flutter_root
  generated_xcode_build_settings_path = File.expand_path(File.join('..', 'Flutter', 'Generated.xcconfig'), __FILE__)
  File.foreach(generated_xcode_build_settings_path) do |line|
    matches = line.match(/FLUTTER_ROOT=(.*)/)
    return matches[1].strip if matches
  end
  raise "FLUTTER_ROOT not found in #{generated_xcode_build_settings_path}. Run `flutter build ios` first."
end

# تضمين إعدادات Flutter الخاصة بـ CocoaPods
require File.expand_path(File.join(flutter_root, 'packages', 'flutter_tools', 'bin', 'podhelper'))

# إعداد هدف Runner للتأكد من استخدام الإطارات وملفات رأس وحدة نمطية
target 'Runner' do
  # استخدام الإطارات بدلاً من المكتبات الثابتة
  use_frameworks!
  # استخدام الرؤوس المعيارية (Modular Headers)
  use_modular_headers!

  # تثبيت جميع الحزم الخاصة بـ Flutter لـ iOS
  flutter_install_all_ios_pods(File.dirname(__FILE__))

  # إضافة إعدادات للمكتبات الخارجية إذا كانت هناك حاجة لتخصيص الإعدادات (مثل sqflite)
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      # تخصيص الإعدادات للمكتبات الخارجية مثل sqflite
      if target.name == 'sqflite_darwin'
        target.build_configurations.each do |config|
          config.build_settings['SWIFT_VERSION'] = '5.0'
        end
      end
    end
  end
end
