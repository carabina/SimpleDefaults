Pod::Spec.new do |spec|

  spec.name         = 'SimpleDefaults'
  spec.version      = '1.0.0'
  spec.license      = { :type => 'Apache License 2.0' }
  spec.homepage     = 'https://github.com/anotheren/SimpleDefaults'
  spec.author       = { 'liudong' => 'liudong.edward@gmail.com' }
  spec.summary      = 'A Swift Media Lib'
  spec.source       = { :git => 'https://github.com/anotheren/SimpleDefaults.git',
                        :tag => spec.version }
  spec.swift_version = '4.1'

  spec.ios.deployment_target     = '8.0'

  spec.source_files = 'Sources/**/*.swift'

  spec.dependency 'SimpleBinaryCoder'

end
