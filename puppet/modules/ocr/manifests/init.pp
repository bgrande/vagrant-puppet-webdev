# install various open source ocr tools for developing and testing ocr based app components
import 'gocr/init.pp'
import 'ocrad/init.pp'
import 'tesseract/init.pp'

class ocr {
    include ocr::gocr::install
    include ocr::ocrad::install
    include ocr::tesseract::install
}