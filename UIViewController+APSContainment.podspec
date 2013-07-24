Pod::Spec.new do |s|
  s.name         = 'UIViewController+APSContainment'
  s.summary      = 'A UIViewController category that adds a nicer view controller containment API'
  s.homepage     = 'https://github.com/andrewsardone/UIViewController-APSContainment'
  s.version      =  '0.1.0'
  s.source       = { :git => 'https://github.com/andrewsardone/UIViewController-APSContainment.git', :tag => s.version }
  s.authors      = { 'Andrew Sardone' => 'andrew@andrewsardone.com' }
  s.license      = 'MIT'
  s.source_files = "Classes"
  s.platform     = :ios
end
