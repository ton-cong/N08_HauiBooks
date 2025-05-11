<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đổi Mật Khẩu</title>
        <style>
            /* Thiết lập chung */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Arial', sans-serif;
                background-color: #f1f1f1;
                /* Nền nhẹ nhàng */
                color: #333;
                line-height: 1.6;
                padding: 0;
                margin: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }

            /* Container chính */
            .container {
                width: 100%;
                max-width: 500px;
                background-color: #fff;
                padding: 20px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                margin: 20px;
            }

            /* Tiêu đề */
            header {
                text-align: center;
                margin-bottom: 20px;
            }

            header h1 {
                font-size: 2rem;
                color: #333;
                font-weight: 600;
            }

            /* Form chỉnh sửa mật khẩu */
            .form-container {
                padding: 20px;
            }

            .form-container h2 {
                font-size: 1.5rem;
                margin-bottom: 20px;
                text-align: center;
                color: #444;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                font-size: 1rem;
                color: #555;
                display: block;
                margin-bottom: 8px;
            }

            .form-group input {
                width: 100%;
                padding: 12px;
                font-size: 1rem;
                border: 1px solid #ddd;
                border-radius: 8px;
                outline: none;
                transition: border 0.3s;
            }

            .form-group input:focus {
                border-color: #56cfe1;
                /* Màu xanh nhạt khi focus */
                box-shadow: 0 0 5px rgba(86, 207, 225, 0.3);
            }

            /* Messages lỗi */
            .error-message {
                color: #d9534f;
                font-size: 0.9rem;
                margin-top: 5px;
            }

            /* Buttons */
            .btn {
                width: 100%;
                padding: 14px;
                background-color: #56cfe1;
                /* Màu xanh nhẹ */
                border: none;
                border-radius: 8px;
                color: #fff;
                font-size: 1rem;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin-bottom: 10px;
            }

            .btn:hover {
                background-color: #009c99;
                /* Màu xanh đậm khi hover */
            }

            .cancel-btn {
                background-color: #f1f1f1;
                color: #333;
                border: 1px solid #ddd;
            }

            .cancel-btn:hover {
                background-color: #ddd;
            }

            /* Responsive Design */
            @media (max-width: 768px) {
                .container {
                    width: 90%;
                    padding: 15px;
                }

                header h1 {
                    font-size: 1.8rem;
                }

                .form-container h2 {
                    font-size: 1.3rem;
                }
            }
        </style>
    </head>

    <body>

        <div class="container">
            <header>
                <h1>Đổi Mật Khẩu</h1>
            </header>

            <div class="form-container">
                <h2>Chỉnh sửa mật khẩu của bạn</h2>
                <form id="change-password-form" action="UpdateUser" method="POST" onsubmit="return validateForm()">
                    <!-- Email -->
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" placeholder="Nhập email của bạn" required>
                        <div id="email-error" class="error-message"></div>
                    </div>
                    <!-- Mật khẩu cũ -->
                    <div class="form-group">
                        <label for="old-password">Mật khẩu cũ</label>
                        <input type="password" id="old-password" name="old-password" placeholder="Nhập mật khẩu cũ"
                            required>
                        <div id="old-password-error" class="error-message"></div>
                    </div>
                    <!-- Mật khẩu mới -->
                    <div class="form-group">
                        <label for="new-password">Mật khẩu mới</label>
                        <input type="password" id="new-password" name="new-password" placeholder="Nhập mật khẩu mới"
                            required>
                        <div id="new-password-error" class="error-message"></div>
                    </div>
                    <!-- Xác nhận mật khẩu mới -->
                    <div class="form-group">
                        <label for="confirm-password">Xác nhận mật khẩu mới</label>
                        <input type="password" id="confirm-password" name="confirm-password"
                            placeholder="Xác nhận mật khẩu mới" required>
                        <div id="confirm-password-error" class="error-message"></div>
                    </div>
                    <!-- Các nút -->
                    <button type="submit" class="btn">Lưu thay đổi</button>
                    <button type="button" class="btn cancel-btn" onclick="goBack()">Hủy</button>
                </form>
            </div>
        </div>

        <script>
            function goBack() {
                window.history.back(); // Quay lại trang trước
            }

            function validateForm() {
                // Xóa các thông báo lỗi trước đó
                clearErrors();

                let valid = true;
                const email = document.getElementById("email").value;
                const oldPassword = document.getElementById("old-password").value;
                const newPassword = document.getElementById("new-password").value;
                const confirmPassword = document.getElementById("confirm-password").value;

                // Kiểm tra email
                const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
                if (!emailPattern.test(email)) {
                    document.getElementById("email-error").textContent = "Email không hợp lệ.";
                    valid = false;
                }

                // Kiểm tra mật khẩu cũ (đơn giản cho ví dụ, bạn cần thêm logic để kiểm tra mật khẩu cũ)
                if (oldPassword.length < 6) {
                    document.getElementById("old-password-error").textContent = "Mật khẩu cũ phải có ít nhất 6 ký tự.";
                    valid = false;
                }

                if (newPassword.length < 6) {
                    document.getElementById("new-password-error").textContent = "Mật khẩu mới phải có ít nhất 6 ký tự.";
                    valid = false;
                }

                // if (confirmPassword.length < 6) {
                //     document.getElementById("new-password-error").textContent = "Mật khẩu xác nhận phải có ít nhất 6 ký tự.";
                //     valid = false;
                // }

                // Kiểm tra mật khẩu mới và mật khẩu cũ
                if (newPassword === oldPassword) {
                    document.getElementById("new-password-error").textContent = "Mật khẩu mới không được trùng với mật khẩu cũ.";
                    valid = false;
                }

                // Kiểm tra xác nhận mật khẩu mới
                if (newPassword !== confirmPassword) {
                    document.getElementById("confirm-password-error").textContent = "Mật khẩu mới và xác nhận mật khẩu không khớp.";
                    valid = false;
                }

                return valid; // Nếu valid = true, form sẽ được submit, nếu không sẽ dừng lại
            }

            function clearErrors() {
                document.getElementById("email-error").textContent = "";
                document.getElementById("old-password-error").textContent = "";
                document.getElementById("new-password-error").textContent = "";
                document.getElementById("confirm-password-error").textContent = "";
            }
        </script>

    </body>

    </html>