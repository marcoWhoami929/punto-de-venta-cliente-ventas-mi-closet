<!-- partial -->
<div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12 grid-margin">
                <div class="row">
                    <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                        <h3 class="font-weight-bold">Notas Adquiridas</h3>
                        <h6 class="font-weight-normal mb-0"></span></h6>
                    </div>

                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 grid-margin">
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="exampleFormControlSelect1">Búsqueda</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="mdi mdi-barcode-scan"></i></span>
                                </div>
                                <input type="text" class="form-control form-control-sm" placeholder="Buscar por codigo de nota o venta" id="busqueda" onkeyup="listadoNotasAdquiridas(1)">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="exampleFormControlSelect1">Ordenar Por</label>
                            <select class="form-select" id="campoOrden" onchange="listadoNotasAdquiridas(1)">
                                <option value="fecha_venta">Fecha</option>
                                <option value="estatus">Estatus</option>
                                <option value="fecha_pago">Fecha Pago</option>

                            </select>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="exampleFormControlSelect1">Orden</label>
                            <select class="form-select" id="orden" onchange="listadoNotasAdquiridas(1)">
                                <option value="asc">Asc</option>
                                <option value="desc">Desc</option>

                            </select>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="exampleFormControlSelect1">Visualizar</label>
                            <select class="form-select" id="per_page" onchange="listadoNotasAdquiridas(1)">
                                <option value="10">10</option>
                                <option value="50">50</option>
                                <option value="100">100</option>
                                <option value="all">Todo</option>

                            </select>
                        </div>
                    </div>

                </div>
            </div>
            <div class="row lista-notas-adquiridas">


            </div>

        </div>
    </div>
    <style>
        .countdown {
            width: 300px;
            margin: 0 auto;
            border: 1px solid transparent;
            background: transparent;
            padding: 20px 0px;
            display: flex;
            justify-content: space-evenly;
            border-radius: 10px;
        }

        .box {
            background: #fff;
            border: 2px solid #B99654;
            width: 60px;
            font-size: 20px;
            text-align: center;
            border-radius: 10px;
            color: #B99654;
        }

        .box .text {
            font-size: 12px;
            background: #B99654;
            color: #ffffff;
            padding: 5px 0;
            border-radius: 0px 0px 8px 8px;
        }

        .text-white {
            font-size: 20px;
            text-align: center;
            color: #B99654;
        }
    </style>