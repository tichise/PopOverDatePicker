Pod::Spec.new do |s|
  s.name = 'PopOverDatePicker'
  s.version = '1.4.0'
  s.license = 'MIT'
  s.summary = 'PopOverDatePicker is a PopOver style UIDatePicker.'
  s.homepage = 'https://github.com/tichise/PopOverDatePicker'
  s.social_media_url = 'http://twitter.com/tichise'
  s.author = "Takuya Ichise"
  s.source = { :git => 'https://github.com/tichise/PopOverDatePicker.git', :tag => s.version }

  s.ios.deployment_target = '14.0'

  s.source_files = 'Sources/*.swift'
  s.requires_arc = true

  s.resource_bundles = {
    'PopOverDatePickerStoryboards' => [
        'Sources/Storyboards/*.storyboard'
    ]
  }
end
