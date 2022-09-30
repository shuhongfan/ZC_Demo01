package com.app.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


@WebServlet(urlPatterns = "/upfile")
public class FileUploadServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public FileUploadServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String savePath = "";

		// 在解析请求之前先判断请求类型是否为文件上传类型
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		// 文件上传处理工厂
		FileItemFactory factory = new DiskFileItemFactory();
		// 创建文件上传处理器
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 开始解析请求信息
		List items = null;
		try {
			
			
			
			items = upload.parseRequest(request);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}

		// 对所有请求信息进行判断
		Iterator iter = items.iterator();
		while (iter.hasNext()) {
			FileItem item = (FileItem) iter.next();
			// 信息为普通的格式
			if (item.isFormField()) {
				String fieldName = item.getFieldName();
				String value = item.getString();
				request.setAttribute(fieldName, value);
			}
			// 信息为文件格式
			else {
				String fileName = item.getName();
				savePath = "uploadFile/" + fileName;
				int index = fileName.lastIndexOf("\\");
				fileName = fileName.substring(index + 1);
				request.setAttribute("realFileName", fileName);

				// 将文件写入
				// String path = req.getContextPath();
				// String directory = "uploadFile";
				// String basePath = req.getScheme() + "://" +
				// req.getServerName() + ":" + req.getServerPort() + path + "/"
				// + directory;
				String basePath = request.getRealPath("/uploadFile");
				File file = new File(basePath, fileName);
				try {
					item.write(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		request.setAttribute("Saved", savePath);
		request.setAttribute("message", "Upload OK!~");
		request.getRequestDispatcher("upload.jsp").forward(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
