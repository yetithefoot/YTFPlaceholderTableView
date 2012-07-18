Pod::Spec.new do |s|
  s.name     = 'YTFPlaceholderTableView'
  s.version  = '0.1'
  s.license  = 'MIT'
  s.summary  = 'Simple UITableView with placeholder'
  s.homepage = 'https://github.com/yetithefoot/YTFPlaceholderTableView'
  s.authors  = {'YetiTheFoot' => 'reg.yeti@gmail.com'}
  s.source   = { :git => 'https://github.com/yetithefoot/YTFPlaceholderTableView.git', :tag => '0.1' }
  s.source_files = 'YTFPlaceholderTableView/*.{h,m}'
  s.framework = 'QuartzCore'
end