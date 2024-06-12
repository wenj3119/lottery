package douwen.top.lottery.controller;

import com.google.zxing.WriterException;
import douwen.top.lottery.util.QRCodeGeneratorUtil;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

/**
 * @Author wenjun4
 * @Date 2024/6/12
 * @Description
 */
@RestController
@RequestMapping("/qrcode")
public class QRCodeController {

    @GetMapping("/image")
    public ResponseEntity<byte[]> getImage(

    ) throws WriterException, IOException{
        byte[] imageBytes = QRCodeGeneratorUtil.generateQRCode(
                "https://www.baidu.com", 350, 350);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_JPEG); // Set content type as JPEG
        headers.setContentDisposition(ContentDisposition.inline().build()); // Set inline disposition
        return ResponseEntity.ok()
                .headers(headers)
                .body(imageBytes);
    }

}
