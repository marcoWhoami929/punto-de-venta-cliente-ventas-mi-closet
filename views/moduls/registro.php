<div class="container-fluid page-body-wrapper full-page-wrapper">
    <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
            <div class="col-lg-5 mx-auto">
                <div class="auth-form-light text-center py-5 px-4 px-sm-5">
                    <div class="brand-logo">
                        <img src="views/images/logo.png" alt="logo">
                    </div>
                    <h4>Nuevo(a) por aquí?</h4>
                    <h6 class="font-weight-light">Registra tus datos y forma parte de esta gran familia.</h6>
                    <form class="pt-3" method="POST">
                        <div class="form-group">
                            <label>*Nombre de Usuario Facebook</label>
                            <input type="text" class="form-control form-control-lg" id="usuarioFacebook" name="usuarioFacebook" placeholder="Nombre de Usuario en facebook" required>
                        </div>
                        <div class="form-group">

                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <label>*Nombre(s)</label>
                                    <input type="text" class="form-control form-control-lg" id="nombre" name="nombre" placeholder="Ingresar nombre(s)" required>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <label>*Apellidos</label>
                                    <input type="text" class="form-control form-control-lg" id="apellidos" name="apellidos" placeholder="Ingresar apellidos" required>
                                </div>

                            </div>

                        </div>
                        <div class="form-group">

                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <label>Correo Electrónico</label>
                                    <input type="text" class="form-control form-control-lg" id="email" name="email" placeholder="Ingresar correo electrónico">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <label>*Password</label>
                                    <input type="password" class="form-control form-control-lg" id="password" name="password" placeholder="Ingresar Contraseña" required>
                                </div>

                            </div>

                        </div>
                        <div class="form-group">

                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <label>Teléfono</label>
                                    <input type="tel" class="form-control form-control-lg" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" id="telefono" name="telefono" placeholder="Ingresar correo electrónico">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <label>*Celular</label>
                                    <input type="tel" class="form-control form-control-lg" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" id="celular" name="celular" placeholder="Ingresar Celular" required>
                                </div>

                            </div>

                        </div>

                        <div class="form-group">
                            <label>*Domicilio</label>
                            <input type="text" class="form-control form-control-lg" id="domicilio" name="domicilio" placeholder="Ingresa el domicilio y los campos de direccion se llenarán automaticamente">
                        </div>
                        <div class="form-group">

                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <input id="route" name="route" readonly class="form-control form-control-lg" placeholder="Calle">

                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <input id="street_number" name="street_number" readonly class="form-control form-control-lg" placeholder="Número">

                                </div>

                            </div>

                        </div>
                        <div class="form-group">

                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">

                                    <input id="locality" name="locality" readonly class="form-control form-control-lg" placeholder="Ciudad">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">

                                    <input id="administrative_area_level_1" name="administrative_area_level_1" readonly class="form-control form-control-lg" placeholder="Estado">
                                </div>

                            </div>

                        </div>
                        <div class="form-group">

                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">

                                    <input id="postal_code" name="postal_code" readonly class="form-control form-control-lg" placeholder="Codigo Postal">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">

                                    <input id="country" name="country" readonly class="form-control" class="form-control form-control-lg" placeholder="Pais">
                                </div>

                            </div>

                        </div>


                        <div class="mt-3 d-grid gap-2">

                            <button type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">Registrarme</button>
                        </div>
                        <div class="text-center mt-4 font-weight-light"> Ya tienes una cuenta? <a href="acceso" class="text-primary">Acceder</a>
                        </div>
                        <div class="text-center mt-4 font-weight-light">(*) Campos obligatorios
                        </div>

                        <?php

                        $registro = new ControllerUser();
                        $registro->ctrRegistroUser();

                        ?>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- content-wrapper ends -->
</div>
<script type="text/javascript">
    if (window.history.replaceState) {
        window.history.replaceState(null, null, window.location.href);
    }
</script>