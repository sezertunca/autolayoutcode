
Pod::Spec.new do |spec|

  spec.name         = "AutoLayoutCode"
  spec.version      = "1.0.0"
  spec.swift_version = "5.0" 
  spec.summary      = "Swift AutoLayout in Code"
  spec.homepage     = "https://github.com/sezertunca/autolayoutcode"
  spec.license      = "MIT"
  spec.author       = { "Sezer Tunca" => "sezertunca@gmail.com" }
  spec.author       = "Sezer Tunca"
  spec.source       = { :git => "https://github.com/sezertunca/autolayoutcode.git", :tag => "#{spec.version}" }
  spec.source_files = "AutoLayoutInCode"

end
