#
# Be sure to run `pod lib lint SystranTranslationClient.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = "SystranTranslationClient"
    s.version          = "1.0.0"

    s.summary          = "Rest Translation API"
    s.description      = <<-DESC
                         ### Introduction\n\nTranslation API is a tool that automatically translates text from one language to another.\n\nThe source text is the text to be translated. The source language is the language that the source text is written in. The target language is the language that the source text is translated into.\n\nThis document is intended for developers who want to write applications that can interact with the Translation API. You can use the Translation API to programmatically translate text on your webpages or apps.\n\nYou need an API Key to use Translate API.\n\n\n### Cross Domain\n\nTranslation API supports cross-domain requests through the JSONP or the CORS mechanism.\n\nTranslation API also supports the Silverlight client access policy file (clientaccesspolicy.xml) and the Adobe Flash cross-domain policy file (crossdomain.xml) that handles cross-domain requests.\n\n#### JSONP Support\n\nTranslation API supports JSONP by providing the name of the callback function as a parameter. The response body will be contained in the parentheses:\n\n```javascript\ncallbackFunctionName(/* response body as defined in each API section */);\n```\n#### CORS\n\nTranslation API supports the CORS mechanism to handle cross-domain requests. The server will correctly handle the OPTIONS requests used by CORS.\n\nThe following headers are set as follows:\n\n```\nAccess-Control-Allow-Origin: *\nAccess-Control-Allow-Headers: X-Requested-With,Content-Type,X-HTTP-METHOD-OVERRIDE\n```\n\n### Langage Code Values\n\nThe language codes to be used are the two-letter codes defined by the ISO 639-1:2002, Codes for the representation of names of languages - Part 1: Alpha-2 code standard.\n\nRefer to the column &#39;ISO 639-1 code&#39; of this list: http://www.loc.gov/standards/iso639-2/php/code_list.php.\n\nIn addition to this list, the following codes are used:\n\nLanguage Code |Language\n--------------|---------\nauto | Language Detection\ntj | Tajik (cyrillic script)\nzh-Hans | Chinese (Simplified)\nzh-Hant |Chinese (Traditional)\n\n\n### Escape input text\n\nThe input text passed as a URL parameter will be escaped with an equivalent of the javascript &#39;encodeURIComponent&#39; function.\n\n### Encoding of the input text\n\nThe input text must be encoded in UTF-8.\n\n### Encoding of the output text\n\nThe output text (translated text, error and warning strings) will be encoded in UTF-8.
                         DESC

    s.platform     = :ios, '7.0'
    s.requires_arc = true

    s.framework    = 'SystemConfiguration'

    s.source_files = 'SystranTranslationClient/**/*'
    s.public_header_files = 'SystranTranslationClient/**/*.h'

    s.dependency 'AFNetworking', '~> 2.3'
    s.dependency 'JSONModel', '~> 1.1'
    s.dependency 'ISO8601', '~> 0.3'
end

