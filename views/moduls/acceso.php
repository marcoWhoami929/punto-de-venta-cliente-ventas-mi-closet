<div class="container-fluid page-body-wrapper full-page-wrapper">
    <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
            <div class="col-lg-4 mx-auto">
                <div class="auth-form-light text-center py-5 px-4 px-sm-5">
                    <div class="brand-logo">
                        <img src="views/images/logo.png" alt="logo">
                    </div>
                    <h4>Bienvenido(a)</h4>
                    <h6 class="font-weight-light">Ingresa tus datos para continuar.</h6>
                    <form class="pt-3" method="POST">
                        <div class="form-group">
                            <input type="text" class="form-control form-control-lg" id="username" name="username" placeholder="Nombre de usuario">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control form-control-lg" id="password" name="password" placeholder="Contraseña">
                        </div>
                        <div class="mt-3 d-grid gap-2">
                            <button type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">Acceder</button>
                        </div>
                        <div class="my-2 d-flex justify-content-between align-items-center">
                            <div class="form-check">

                            </div>
                            <a href="#" class="auth-link text-black">Olvidaste tu contraseña?</a>
                        </div>

                        <div class="text-center mt-4 font-weight-light"> No tienes una cuenta? <a href="registro" class="text-primary">Registrarme</a>
                        </div>
                        <?php

                        $login = new ControllerUser();
                        $login->ctrAccesoUser();

                        ?>
                    </form>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            if (window.history.replaceState) {
                window.history.replaceState(null, null, window.location.href);
            }
        </script>