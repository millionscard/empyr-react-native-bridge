require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "empyr-react-native-bridge"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                  empyr-bridge
                   DESC
  s.homepage     = "https://github.com/EmpyrNetwork/empyr-react-native-bridge"
  s.license      = "MIT"
  # s.license    = { :type => "MIT", :file => "FILE_LICENSE" }
  s.authors      = { "Jason Bausewein" => "jbausewein@empyr.com" }
  s.platforms    = { :ios => "9.0", :tvos => "10.0" }
  s.source       = { :git => "https://github.com/EmpyrNetwork/empyr-react-native-bridge", :tag => "#{s.version}" }
  s.swift_version = "4.1"
  s.source_files = "ios/**/*.{h,m,swift}"
  s.requires_arc = true

  s.dependency "React"
	
  # s.dependency "..."
end

