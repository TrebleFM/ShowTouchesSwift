Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.name         = "VisibleTouchViewSwift"
  s.version      = "0.1.0"
  s.summary      = "Show finger touches on the screen"

  s.description  = "Show finger touches on the screen using either a UIView or UIWindow. Useful for app preview videos, live product demos, and more."

  s.homepage     = "https://github.com/TrebleFM/VisibleTouchViewSwift"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.license      = { :type => "MIT", :file => "LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.author       = { "Benjamin Chrobot" => "benjamin.chrobot@alum.mit.edu" }


  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.platform     = :ios, "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source       = { :git => "https://github.com/TrebleFM/VisibleTouchViewSwift.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source_files  = "VisibleTouchViewSwift", "VisibleTouchViewSwift/**/*.{h,m,swift}"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }

end
