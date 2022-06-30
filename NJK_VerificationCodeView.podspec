Pod::Spec.new do |spec|

  spec.name              = 'NJK_VerificationCodeView'

  spec.version           = '0.0.1'

  spec.summary           = 'A validation box that can be expanded freely'

  spec.description       = 'TA verification code used for a certain number of digits.'

  spec.homepage          = 'https://github.com/jiangkuoniu/NJK_VerificationCodeView'

  spec.license           = { :type => 'MIT', :file => 'LICENSE' }

  spec.authors           = {'NJK' => '707429313@qq.com'}

  spec.platform          = :ios, '9.0'

  spec.source            = {:git => 'https://github.com/jiangkuoniu/NJK_VerificationCodeView.git', :tag => spec.version.to_s }



  spec.source_files     = 'Library/NJK_VerificationCodeViewHeader.h'

  spec.subspec 'CodeView' do |codeview|
    codeview.source_files = 'Library/CodeView/*.{h,m}'
  end

  spec.subspec 'BoxBackView' do |boxbackview|
    boxbackview.source_files = 'Library/BoxBackView/*.{h,m}'
  end



  spec.requires_arc      = true

  spec.framework         = 'UIKit' 

  spec.dependency        'Masonry'

end
