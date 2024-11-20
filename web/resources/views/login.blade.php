<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login Page</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,300;0,400;0,700;0,&display=swap"
        rel="stylesheet" />

    <!-- My Styke -->
    <link rel="stylesheet" href="{{ asset('css/login.css') }}" />
</head>

<body>
    <div class="main">
        <div class="login">
            <img class="GymnationLogo" src="{{ asset('assets/icon-appbar.png') }}" alt="Gymnation Logo" />
            <div class="input">
                <div class="container">
                    <div class="inputMail">
                        <label for="email">Email</label>
                        <input type="email" id="email">
                    </div>
                    <div class="inputPass">
                        <label for="password">Password</label>
                        <input type="password" id="password">
                        <div class="lupaPassword">
                            <a href="">
                                lupa password
                            </a>

                        </div>
                    </div>
                    <div class="btn">
                        <button>login</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
