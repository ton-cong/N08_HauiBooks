<%@page import="model.KhuyenMai"%>
<%@page import="Reponsitory.Laydulieuchonguoidung"%>
<%@page import="model.SanPham"%>
<%@page import="java.util.List"%>
<%@page import="Reponsitory.LaydulieuReponsitory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Khuyến Mãi</title>
    <!-- Thêm Font Awesome từ CDN -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<link href="assetsquantri/img/logo1.png" rel="icon">   
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        h1 {
            color: #333;
        }

        .btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
        }

        .btn:hover {
            background-color: #45a049;
        }

        .promo-form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .promo-form h2 {
            margin-bottom: 20px;
        }

        .promo-form input, .promo-form select, .promo-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .promo-form input[type="number"] {
            max-width: 100px;
        }

        .promo-form .cancel {
            background-color: #f44336;
        }

        .promo-list {
            margin-top: 30px;
        }

        .promo-list table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .promo-list th, .promo-list td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        .promo-list th {
            background-color: #f1f1f1;
        }

        .promo-list td {
            background-color: white;
        }

        .promo-list td button {
            background-color: #ff9800;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            font-size: 14px;
            border-radius: 5px;
        }

        .promo-list td button:hover {
            background-color: #e68900;
        }

        .back-btn {
            margin-top: 20px;
            display: inline-block;
            background-color: #2196F3;
            padding: 10px 20px;
            color: white;
            text-align: center;
            font-size: 16px;
            border-radius: 5px;
            text-decoration: none;
        }

        .back-btn:hover {
            background-color: #1e88e5;
        }

        .hidden {
            display: none;
        }
        .search-container {
            margin-bottom: 20px;
        }

        .search-container input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
            max-width: 400px;
            margin: 0 auto;
            display: block;
        }
    </style>
</head>
<body>
    <div class="container">
        <header class="header">
            <h1>Quản Lý Khuyến Mãi</h1>
            <button id="addPromoBtn" class="btn">Thêm Khuyến Mãi Mới</button>
        </header>

        <a href="Bieudodoanhthu" class="back-btn">Quay lại Trang Chính</a>

		<div class="search-container">
			<input type="text" id="searchInput"
				placeholder="Tìm kiếm theo tên hoặc mô tả khuyến mãi...">
		</div>
		<div id="promoForm" class="promo-form hidden">
            <h2>Thêm Khuyến Mãi</h2>
            <form id="promoFormContent" action="ThemKhuyenMai" method="post">
                <label for="promoName">Tên Khuyến Mãi</label>
                <input type="text" id="promoName" name="tenKhuyenMai" required>
                
                <label for="promoDescription">Mô Tả</label>
                <textarea id="promoDescription" name="moTa" required></textarea>
                
                <label for="promoDiscount">Giảm Giá (%)</label>
                <input type="number" id="promoDiscount" name="phanTramGiamGia" required min="0" step="0.1" max="100">
                
                <label for="promoProduct">Chọn Sản Phẩm</label>
                <select id="promoProduct" name="idchonSanPham" required>
                    <option value="">Chọn sản phẩm</option>
                    <%
                    LaydulieuReponsitory lg = new LaydulieuReponsitory();
                	List<SanPham> sp = lg.Laythongtinsanpham();
                	for(SanPham s : sp){
                    %>
                    <option value="<%= s.getMaSanpham()%>"><%=s.getTenSanPham() %></option>
                    
                    <%} %>
                </select>
                
                <button type="submit" class="btn">Lưu Khuyến Mãi</button>
               <!--  <button type="button" id="cancelBtn" class="btn cancel">Hủy</button> -->
            </form>
        </div>

        <section class="promo-list">
            <h2>Danh Sách Khuyến Mãi</h2>
            <table id="promoTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên</th>
                        <th>Mô Tả</th>
                        <th>Giảm Giá (%)</th>
                        <th>Sản Phẩm</th>
                        <th>Hành Động</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
                    List<KhuyenMai> km = lgn.LayThongTinKhuyenMai();
                    int i = 1;
                    for(KhuyenMai khuyenMai : km){
                    	
                    %>
                    <tr>
                        <td><%=i %></td>
                        <td><%=khuyenMai.getMaKhuyenMai() %></td>
                        <td><%=khuyenMai.getNoiDungKhuyenMai() %></td>
                        <td><%= (int)(khuyenMai.getPhanTramKhuyenMai()) %>%</td>
                        <td><%=khuyenMai.getMaSanpham() %></td>
                        <td text-center>
                        <form action="XoaKhuyenMai" method="post">
                        <input name="idXoa" value="<%=khuyenMai.getMaKhuyenMai()%>" type="hidden">
                         <button class="deleteBtn" data-index="0" onclick="thongbao()">Xóa</button>
                        </form>
                           
                        </td>
                    </tr>
                    <%
                    i= i+1;
                    } 
                    String thongBaoXoaThanhCong = (String) request.getAttribute("xoa");
                    String thongBaoXoaThatBai = (String) request.getAttribute("loi");
                    if(thongBaoXoaThanhCong != null){
                    %>
					<script>
					 alert("Xóa khuyến mãi thành công.");
                   </script>
					<%
					}
                    if(thongBaoXoaThatBai != null){
					%>
					<script>
					 alert("Xóa sản phẩm thất bại.");
                   </script>
					<%} %>
                </tbody>
            </table>
        </section>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const promoList = [
                { id: 1, name: 'Khuyến Mãi 1', description: 'Giảm giá 20% cho sản phẩm A', discount: 20, product: 'Sản phẩm 1' },
                { id: 2, name: 'Khuyến Mãi 2', description: 'Giảm giá 15% cho sản phẩm B', discount: 15, product: 'Sản phẩm 2' },
            ];
            const promoTable = document.getElementById('promoTable').getElementsByTagName('tbody')[0];
            const addPromoBtn = document.getElementById('addPromoBtn');
            const promoForm = document.getElementById('promoForm');
            const cancelBtn = document.getElementById('cancelBtn');
            const promoFormContent = document.getElementById('promoFormContent');

            let editIndex = -1;

            addPromoBtn.addEventListener('click', () => {
                promoForm.classList.remove('hidden');
                editIndex = -1; 
                promoFormContent.reset();
            });

            cancelBtn.addEventListener('click', () => {
                promoForm.classList.add('hidden');
            });

            promoFormContent.addEventListener('submit', (e) => {
                e.preventDefault();

                const newPromo = {
                    id: editIndex === -1 ? promoList.length + 1 : promoList[editIndex].id,
                    name: e.target.promoName.value,
                    description: e.target.promoDescription.value,
                    discount: e.target.promoDiscount.value,
                    product: e.target.promoProduct.value,
                };

                if (editIndex === -1) {
                    promoList.push(newPromo);
                } else {
                    promoList[editIndex] = newPromo;
                }

                updatePromoTable();
                promoForm.classList.add('hidden');
                e.target.reset();
            });

            function updatePromoTable() {
                promoTable.innerHTML = '';
                promoList.forEach((promo, index) => {
                    const row = promoTable.insertRow();
                    row.innerHTML = `
                        <td>${promo.id}</td>
                        <td>${promo.name}</td>
                        <td>${promo.description}</td>
                        <td>${promo.discount}%</td>
                        <td>${promo.product}</td>
                        <td>
                            <button class="editBtn" data-index="${index}">Sửa</button>
                            <button class="deleteBtn" data-index="${index}">Xóa</button>
                        </td>
                    `;
                });

                const deleteBtns = document.querySelectorAll('.deleteBtn');
                deleteBtns.forEach((btn) => {
                    btn.addEventListener('click', (e) => {
                        const index = e.target.getAttribute('data-index');
                        promoList.splice(index, 1);
                        updatePromoTable();
                    });
                });

                const editBtns = document.querySelectorAll('.editBtn');
                editBtns.forEach((btn) => {
                    btn.addEventListener('click', (e) => {
                        const index = e.target.getAttribute('data-index');
                        const promo = promoList[index];

                        document.getElementById('promoName').value = promo.name;
                        document.getElementById('promoDescription').value = promo.description;
                        document.getElementById('promoDiscount').value = promo.discount;
                        document.getElementById('promoProduct').value = promo.product;

                        promoForm.classList.remove('hidden');
                        editIndex = index;
                    });
                });
            }

            updatePromoTable();
        });
        document.addEventListener('DOMContentLoaded', () => {
            const searchInput = document.getElementById('searchInput');
            const promoTable = document.getElementById('promoTable').getElementsByTagName('tbody')[0];

            // Hàm lọc các khuyến mãi
            function filterPromos() {
                const query = searchInput.value.toLowerCase();
                const rows = promoTable.getElementsByTagName('tr');

                for (const row of rows) {
                    const cells = row.getElementsByTagName('td');
                    const promoName = cells[1].textContent.toLowerCase();
                    const promoDescription = cells[2].textContent.toLowerCase();

                    if (promoName.includes(query) || promoDescription.includes(query)) {
                        row.style.display = ''; // Hiển thị dòng
                    } else {
                        row.style.display = 'none'; // Ẩn dòng
                    }
                }
            }

            // Lắng nghe sự kiện khi người dùng gõ vào ô tìm kiếm
            searchInput.addEventListener('input', filterPromos);
        });
        function thongbao() {
        	
                alert("Bạn có chắc xóa sản phẩm này chứ");
                
            
		}
    </script>
</body>
</html>
