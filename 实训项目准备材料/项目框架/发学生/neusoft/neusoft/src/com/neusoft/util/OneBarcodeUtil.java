package com.neusoft.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;

import org.apache.struts2.ServletActionContext;
import org.jbarcode.JBarcode;
import org.jbarcode.encode.Code39Encoder;
import org.jbarcode.encode.EAN13Encoder;
import org.jbarcode.paint.BaseLineTextPainter;
import org.jbarcode.paint.EAN13TextPainter;
import org.jbarcode.paint.WideRatioCodedPainter;
import org.jbarcode.paint.WidthCodedPainter;
import org.jbarcode.util.ImageUtil;

import com.neusoft.comon.init.PropertiesUtil;

/**
 * 2013-01-02
 * 
 * @author 周强
 */
public class OneBarcodeUtil {
	static void saveToJPEG(BufferedImage paramBufferedImage, String paramString) {
		saveToFile(paramBufferedImage, paramString, "jpeg");
	}

	static void saveToPNG(BufferedImage paramBufferedImage, String paramString) {
		saveToFile(paramBufferedImage, paramString, "png");
	}

	static void saveToGIF(BufferedImage paramBufferedImage, String paramString) {
		saveToFile(paramBufferedImage, paramString, "gif");
	}

	static void saveToFile(BufferedImage paramBufferedImage,
			String paramString1, String paramString2) {
		String barCodePath=ServletActionContext.getServletContext().getRealPath("/")+ File.separator + PropertiesUtil.get("barCodePath");
		System.err.println("获取的系统物理路径为"+barCodePath);
		try {
			FileOutputStream localFileOutputStream = new FileOutputStream(
					barCodePath + paramString1);
			ImageUtil.encodeAndWrite(paramBufferedImage, paramString2,
					localFileOutputStream, 96, 96);
			localFileOutputStream.close();
		} catch (Exception localException) {
			localException.printStackTrace();
		}
	}
	/**
	 * @author zhouq
	 * 生成条形码图片
	 * @param str
	 */
	public static void createBarCode(String str){
		try {
			JBarcode localJBarcode = new JBarcode(EAN13Encoder.getInstance(),
					WidthCodedPainter.getInstance(), EAN13TextPainter
							.getInstance());
			// 生成. 欧洲商品条码(=European Article Number)
			// 这里我们用作图书条码
			BufferedImage localBufferedImage; //= localJBarcode.createBarcode(str);
			//saveToGIF(localBufferedImage, "EAN13.gif");
			localJBarcode.setEncoder(Code39Encoder.getInstance());
			localJBarcode.setPainter(WideRatioCodedPainter.getInstance());
			localJBarcode.setTextPainter(BaseLineTextPainter.getInstance());
			localJBarcode.setShowCheckDigit(false);
			
			localBufferedImage = localJBarcode.createBarcode(str);
			saveToPNG(localBufferedImage, str+".png");
			System.err.println("图片生成成功！");

		} catch (Exception localException) {
			localException.printStackTrace();
		}
	}
	public static void main(String[] paramArrayOfString) {
		try {
			JBarcode localJBarcode = new JBarcode(EAN13Encoder.getInstance(),
					WidthCodedPainter.getInstance(), EAN13TextPainter
							.getInstance());
			// 生成. 欧洲商品条码(=European Article Number)
			// 这里我们用作图书条码
			String str = "F130101000002";
			BufferedImage localBufferedImage = localJBarcode.createBarcode(str);
			//saveToGIF(localBufferedImage, "EAN13.gif");
			localJBarcode.setEncoder(Code39Encoder.getInstance());
			localJBarcode.setPainter(WideRatioCodedPainter.getInstance());
			localJBarcode.setTextPainter(BaseLineTextPainter.getInstance());
			localJBarcode.setShowCheckDigit(false);
			
			localBufferedImage = localJBarcode.createBarcode(str);
			saveToPNG(localBufferedImage, str+".png");

		} catch (Exception localException) {
			localException.printStackTrace();
		}
	}
	
}
