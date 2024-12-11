<div class="main-panel">

    <div class="content-wrapper">

        <div class="row">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <div class="col-md-12 grid-margin">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleFormControlSelect1">Búsqueda</label>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text"><i class="mdi mdi-barcode-scan"></i></span>
                                                    </div>
                                                    <input type="text" class="form-control form-control-sm" placeholder="Buscar nota" id="busqueda" onkeyup="listadoEstatusNotas(1)">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="exampleFormControlSelect1">Ordenar Por</label>
                                                <select class="form-select" id="campoOrden" onchange="listadoEstatusNotas(1)">
                                                    <option value="fecha_venta">Notas Pagadas</option>


                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="exampleFormControlSelect1">Orden</label>
                                                <select class="form-select" id="orden" onchange="listadoEstatusNotas(1)">
                                                    <option value="asc">Asc</option>
                                                    <option value="desc">Desc</option>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="exampleFormControlSelect1">Visualizar</label>
                                                <select class="form-select" id="per_page" onchange="listadoEstatusNotas(1)">
                                                    <option value="10">10</option>
                                                    <option value="50">50</option>
                                                    <option value="100">100</option>
                                                    <option value="all">Todo</option>

                                                </select>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="row listado-estatus-notas">


                    </div>

                </div>

            </div>



        </div>
    </div>

</div>
<!-- main-panel ends -->
<style>
    .steps .step {
        display: block;
        width: 100%;
        margin-bottom: 35px;
        text-align: center
    }

    .steps .step .step-icon-wrap {
        display: block;
        position: relative;
        width: 100%;
        height: 80px;
        text-align: center
    }

    .steps .step .step-icon-wrap::before,
    .steps .step .step-icon-wrap::after {
        display: block;
        position: absolute;
        top: 50%;
        width: 50%;
        height: 13px;
        margin-top: -1px;
        background-color: #B99654;
        content: '';
        z-index: 1
    }

    .steps .step .step-icon-wrap::before {
        left: 0
    }

    .steps .step .step-icon-wrap::after {
        right: 0
    }

    .steps .step .step-icon {
        display: inline-block;
        position: relative;
        width: 80px;
        height: 80px;
        border: 1px solid #e1e7ec;
        border-radius: 50%;
        background-color: #f5f5f5;
        color: #374250;
        font-size: 38px;
        line-height: 81px;
        z-index: 5
    }

    .steps .step .step-title {
        margin-top: 16px;
        margin-bottom: 0;
        color: #606975;
        font-size: 14px;
        font-weight: 500
    }

    .steps .step:first-child .step-icon-wrap::before {
        display: none
    }

    .steps .step:last-child .step-icon-wrap::after {
        display: none
    }

    .steps .step.completed .step-icon-wrap::before,
    .steps .step.completed .step-icon-wrap::after {
        background-color: #0da9ef
    }

    .steps .step.completed .step-icon {
        border-color: #0da9ef;
        background-color: #0da9ef;
        color: #fff
    }

    @media (max-width: 576px) {

        .flex-sm-nowrap .step .step-icon-wrap::before,
        .flex-sm-nowrap .step .step-icon-wrap::after {}
    }

    @media (max-width: 768px) {

        .flex-md-nowrap .step .step-icon-wrap::before,
        .flex-md-nowrap .step .step-icon-wrap::after {}
    }

    @media (max-width: 991px) {

        .flex-lg-nowrap .step .step-icon-wrap::before,
        .flex-lg-nowrap .step .step-icon-wrap::after {}
    }

    @media (max-width: 1200px) {

        .flex-xl-nowrap .step .step-icon-wrap::before,
        .flex-xl-nowrap .step .step-icon-wrap::after {}
    }

    .bg-faded,
    .bg-secondary {
        background-color: #f5f5f5 !important;
    }

    /***RIBBON CSS */
    .ribbon {
        --f: 15px;
        /* control the folded part */
        height: 50px;
        position: absolute;
        top: 0;
        color: #fff;
        padding: .6em 1.8em;
        background: var(--c, #45ADA8);
        border-bottom: var(--f) solid #0007;
        clip-path: polygon(100% calc(100% - var(--f)), 100% 100%, calc(100% - var(--f)) calc(100% - var(--f)), var(--f) calc(100% - var(--f)), 0 100%, 0 calc(100% - var(--f)), 999px calc(100% - var(--f) - 999px), calc(100% - 999px) calc(100% - var(--f) - 999px))
    }

    .right {
        right: 0;
        transform: translate(calc((1 - cos(45deg))*100%), -100%) rotate(45deg);
        transform-origin: 0% 100%;
    }
</style>