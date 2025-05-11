package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DanhMuc;
import model.SanPham;

import java.io.IOException;
import java.util.List;

import Reponsitory.LaydulieuReponsitory;
import Reponsitory.Laydulieuchonguoidung;

/**
 * Servlet implementation class Timkiemsanpham
 */
@WebServlet("/Timkiemsanpham")
public class Timkiemsanpham extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
      private LaydulieuReponsitory lg = new LaydulieuReponsitory();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Timkiemsanpham() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String timKiem = request.getParameter("timKiem");
		List<SanPham> list = lgn.TimKiemSanPham(timKiem);
		List<DanhMuc> listDanhMuc = lg.Laythongtidanhmuc();
		request.setAttribute("listDanhMuc", listDanhMuc);
		request.setAttribute("listHome", list);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
		
	}

}
