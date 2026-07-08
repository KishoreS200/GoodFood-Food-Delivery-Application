<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet" href="css/cursor.css">
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

/* ===========================
   RESET
=========================== */

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

html{
    scroll-behavior:smooth;
}

body{
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:50px 20px;
    overflow-y:auto;
    overflow-x:hidden;
    position:relative;
}

/* ===========================
   BACKGROUND VIDEO
=========================== */

.bg-video{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    object-fit:cover;
    z-index:-2;
}

/* ===========================
   DARK OVERLAY
=========================== */

.overlay{
    position:fixed;
    inset:0;
    background:rgba(0,0,0,.42);
    backdrop-filter:blur(2px);
    z-index:-1;
}

/* ===========================
   REGISTER CARD
=========================== */

.form{

    width:520px;
    max-width:95%;

    padding:38px;

    border-radius:28px;

    background:rgba(255,255,255,.15);

    backdrop-filter:blur(18px);
    -webkit-backdrop-filter:blur(18px);

    border:1px solid rgba(255,255,255,.22);

    box-shadow:
    0 25px 60px rgba(0,0,0,.35);

    animation:fadeIn .8s ease;

    transition:.35s;
}

.form:hover{

    transform:translateY(-5px);

    box-shadow:
    0 35px 70px rgba(0,0,0,.45);

}

/* ===========================
   ANIMATION
=========================== */

@keyframes fadeIn{

    from{

        opacity:0;
        transform:translateY(35px);

    }

    to{

        opacity:1;
        transform:translateY(0);

    }

}

/* ===========================
   TITLE
=========================== */

.form h1{

    color:white;

    text-align:center;

    font-size:38px;

    margin-bottom:8px;

    font-weight:700;

}

.subtitle{

    color:#f3f3f3;

    text-align:center;

    margin-bottom:28px;

    font-size:16px;

    line-height:1.5;

}

/* ===========================
   FORM GROUP
=========================== */

.form-group{

    margin-bottom:18px;

}

.form-group label{

    display:block;

    color:white;

    font-weight:600;

    margin-bottom:8px;

    font-size:15px;

}

/* ===========================
   INPUT WRAPPER
=========================== */

.inputForm{

    display:flex;

    align-items:center;

    background:white;

    border-radius:50px;

    height:56px;

    padding:0 18px;

    transition:.3s;

    box-shadow:
    0 8px 20px rgba(0,0,0,.08);

}

.inputForm:focus-within{

    transform:translateY(-2px);

    box-shadow:
    0 0 0 4px rgba(255,136,0,.25);

}

/* ===========================
   INPUT ICON
=========================== */

.inputForm i{

    color:#ff7b00;

    font-size:18px;

    width:22px;

}

/* ===========================
   INPUT
=========================== */

.input{

    border:none;

    outline:none;

    width:100%;

    margin-left:12px;

    font-size:15px;

    background:transparent;

}

::placeholder{

    color:#9a9a9a;

}

/* ===========================
   TEXTAREA
=========================== */

.textareaForm{

    background:white;

    border-radius:22px;

    padding:15px;

    box-shadow:
    0 8px 20px rgba(0,0,0,.08);

    transition:.3s;

}

.textareaForm:focus-within{

    box-shadow:
    0 0 0 4px rgba(255,136,0,.25);

}

.textareaForm textarea{

    width:100%;

    height:90px;

    resize:none;

    border:none;

    outline:none;

    background:none;

    font-size:15px;

}

/* ===========================
   REGISTER BUTTON
=========================== */

.styled-button{

    width:100%;

    height:58px;

    margin-top:12px;

    border:none;

    border-radius:50px;

    background:linear-gradient(135deg,#ff7a18,#ff9800);

    color:white;

    font-size:18px;

    font-weight:600;

    cursor:pointer;

    display:flex;

    justify-content:center;

    align-items:center;

    gap:12px;

    transition:.35s;

    box-shadow:
    0 15px 30px rgba(255,122,24,.45);

}

.styled-button:hover{

    transform:translateY(-3px);

    box-shadow:
    0 22px 40px rgba(255,122,24,.55);

}

.styled-button:active{

    transform:scale(.97);

}

.inner-button{

    width:38px;

    height:38px;

    border-radius:50%;

    background:rgba(255,255,255,.25);

    display:flex;

    justify-content:center;

    align-items:center;

}

.icon{

    transition:.3s;

}

.styled-button:hover .icon{

    transform:translateX(5px);

}

/* ===========================
   LOGIN LINK
=========================== */

.login-link{

    text-align:center;

    margin-top:25px;

    color:white;

    font-size:15px;

}

.login-link a{

    color:#ffd7b0;

    text-decoration:none;

    font-weight:600;

    transition:.3s;

}

.login-link a:hover{

    color:white;

}

/* ===========================
   SCROLLBAR
=========================== */

::-webkit-scrollbar{

    width:8px;

}

::-webkit-scrollbar-thumb{

    background:#ff8a00;

    border-radius:20px;

}

/* ===========================
   RESPONSIVE
=========================== */

@media(max-width:600px){

    body{

        padding:30px 15px;

    }

    .form{

        width:100%;
        padding:28px;

    }

    .form h1{

        font-size:30px;

    }

    .subtitle{

        font-size:15px;

    }

    .inputForm{

        height:52px;

    }

    .styled-button{

        height:54px;

        font-size:16px;

    }

}
</style>

</head>
<body>

    <!-- Background Video -->
    <video autoplay muted loop playsinline class="bg-video">
        <source src="videos/Bg.mp4" type="video/mp4">
    </video>

    <div class="overlay"></div>

    <div class="form">

        <h1>🍴 Create Account</h1>

        <p class="subtitle">
            Join GoodFoods and start ordering delicious meals
        </p>

        <form action="RegisterServlet" method="post">

            <!-- Username -->

            <div class="form-group">

                <label>User Name</label>

                <div class="inputForm">

                    <i class="fa-solid fa-user"></i>

                    <input
                        class="input"
                        type="text"
                        name="userName"
                        placeholder="Enter username"
                        required>

                </div>

            </div>

            <!-- Email -->

            <div class="form-group">

                <label>Email</label>

                <div class="inputForm">

                    <i class="fa-solid fa-envelope"></i>

                    <input
                        class="input"
                        type="email"
                        name="email"
                        placeholder="Enter email"
                        required>

                </div>

            </div>

            <!-- Password -->

            <div class="form-group">

                <label>Password</label>

                <div class="inputForm">

                    <i class="fa-solid fa-lock"></i>

                    <input
                        class="input"
                        type="password"
                        name="password"
                        placeholder="Enter password"
                        required>

                </div>

            </div>

            <!-- Confirm Password -->

            <div class="form-group">

                <label>Confirm Password</label>

                <div class="inputForm">

                    <i class="fa-solid fa-lock"></i>

                    <input
                        class="input"
                        type="password"
                        name="confirmPassword"
                        placeholder="Confirm password"
                        required>

                </div>

            </div>

            <!-- Address -->

            <div class="form-group">

                <label>Address</label>

                <div class="textareaForm">

                    <textarea
                        name="address"
                        placeholder="Enter your address"
                        required></textarea>

                </div>

            </div>

            <!-- Register Button -->

            <button type="submit" class="styled-button">

                Register

                <span class="inner-button">

                    <svg
                        class="icon"
                        xmlns="http://www.w3.org/2000/svg"
                        width="18"
                        height="18"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="white"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round">

                        <line x1="5" y1="12" x2="19" y2="12"></line>

                        <polyline points="12 5 19 12 12 19"></polyline>

                    </svg>

                </span>

            </button>

        </form>

        <div class="login-link">

            Already have an account?

            <a href="login.jsp">Login</a>

        </div>

    </div>
</body>
</html>
