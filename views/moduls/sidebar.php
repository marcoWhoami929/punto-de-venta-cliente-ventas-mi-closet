<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item" style="background:#B99654">
            <a class="nav-link" href="#">

                <span class="menu-title">
                    <strong style="color:#ffffff"><?= $_SESSION["usuario"] ?></strong>
                </span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="inicio">
                <i class="icon-grid menu-icon"></i>
                <span class="menu-title">Tablero</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="listaNotas">
                <i class="mdi mdi-book-open menu-icon"></i>
                <span class="menu-title">Todas las Notas</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="notasAdquiridas">
                <i class="mdi mdi-cart-outline menu-icon"></i>
                <span class="menu-title">Notas Adquiridas</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="notasPendientes">
                <i class="mdi mdi-currency-usd menu-icon"></i>
                <span class="menu-title">Notas Por Pagar</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="estatusNotas">
                <i class="mdi mdi-flag-checkered menu-icon"></i>
                <span class="menu-title">Estatus</span>
            </a>
        </li>
    </ul>
</nav>