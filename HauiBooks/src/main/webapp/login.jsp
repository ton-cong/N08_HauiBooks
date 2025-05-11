 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop</title>
    <link rel="stylesheet" href="cssdangnhap/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" />
</head>
<body>

    <div class="auth-wrapper">
        <div class="auth-container">
            <div class="auth-action-left">
<div class="auth-form-outer" style="margin-top: 100px;">
                    <h2 class="auth-form-title">
                        Đăng nhập
                    </h2>
                    <form class="login-form" action="dang-nhap" method="post">
                        <input type="text" class="auth-form-input" placeholder="Tên đăng nhập" name="tenDangNhap">
                        <div class="input-icon">
                            <input type="password" class="auth-form-input" placeholder="Mật khẩu" name="matKhau">
                            <i class="fa fa-eye show-password"></i>
                        </div>
                        <label class="btn active">
                            <input type="checkbox" name='email1' checked>
                            <i class="fa fa-square-o"></i><i class="fa fa-check-square-o"></i> 
                            <span> Lưu mật khẩu</span>
                        </label>
                        <div class="footer-action">
                            <input type="submit" value="Đăng nhập" class="auth-submit">
                            <a href="register.jsp" class="auth-btn-direct">Đăng kí</a>
                        </div>
                    </form>
                    <div class="auth-forgot-password">
                        <a href="#">Quên mật khẩu</a>
                    </div>
                    <div class="auth-external-container">
                        <!-- <p class="auth-sgt">or sign in with:</p> -->
                    </div>
                     <div class="auth-external-list">
                            <ul>
                                <li><a href="#"><i class="fa fa-google"></i></a></li>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            </ul>
                        </div>
                </div>
            </div>
      <!--  -->      
            <div class="auth-action-right">
                <div class="auth-image">
                    <img src="assetsdangnhap/vector.png" alt="login">
                </div>
            </div>
        </div>
    </div>
    <script src="jsdangnhap/common.js"></script>
</body>
</html>