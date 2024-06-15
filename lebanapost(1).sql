-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-06-2024 a las 05:47:40
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lebanapost`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `categoria_almaceb_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`id`, `nombre`, `categoria_almaceb_id`) VALUES
(1, 'Compras recibidas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add categoriaProducto', 7, 'add_categoriaproducto'),
(26, 'Can change categoriaProducto', 7, 'change_categoriaproducto'),
(27, 'Can delete categoriaProducto', 7, 'delete_categoriaproducto'),
(28, 'Can view categoriaProducto', 7, 'view_categoriaproducto'),
(29, 'Can add productos', 8, 'add_productos'),
(30, 'Can change productos', 8, 'change_productos'),
(31, 'Can delete productos', 8, 'delete_productos'),
(32, 'Can view productos', 8, 'view_productos'),
(33, 'Can add paquete', 9, 'add_paquete'),
(34, 'Can change paquete', 9, 'change_paquete'),
(35, 'Can delete paquete', 9, 'delete_paquete'),
(36, 'Can view paquete', 9, 'view_paquete'),
(37, 'Can add usuario', 10, 'add_usuario'),
(38, 'Can change usuario', 10, 'change_usuario'),
(39, 'Can delete usuario', 10, 'delete_usuario'),
(40, 'Can view usuario', 10, 'view_usuario'),
(41, 'Can add categoriAlmacen', 11, 'add_categorialmacen'),
(42, 'Can change categoriAlmacen', 11, 'change_categorialmacen'),
(43, 'Can delete categoriAlmacen', 11, 'delete_categorialmacen'),
(44, 'Can view categoriAlmacen', 11, 'view_categorialmacen'),
(45, 'Can add Almacen', 12, 'add_almacen'),
(46, 'Can change Almacen', 12, 'change_almacen'),
(47, 'Can delete Almacen', 12, 'delete_almacen'),
(48, 'Can view Almacen', 12, 'view_almacen');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$pT0uuBIG30QLDXZ40dzIIx$6B5ZyZQuitXOH2aydNkxyvrXGqfcvi/6VDx/Rre661U=', '2024-06-13 17:36:57.000000', 1, 'admin', 'Liana', 'Maletá', 'lianamaleta1@gmail.com', 1, 1, '2024-06-13 12:47:26.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorialmacen`
--

CREATE TABLE `categorialmacen` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorialmacen`
--

INSERT INTO `categorialmacen` (`id`, `nombre`) VALUES
(1, 'Compras Recibidas / Sin clasificar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriaproducto`
--

CREATE TABLE `categoriaproducto` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoriaproducto`
--

INSERT INTO `categoriaproducto` (`id`, `nombre`) VALUES
(1, 'Miscelaneas'),
(2, 'Aseo'),
(3, 'Alimentación');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL
) ;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-06-14 21:46:40.198771', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1),
(2, '2024-06-14 22:20:41.239895', '1', 'None', 1, '[{\"added\": {}}]', 10, 1),
(3, '2024-06-14 22:51:18.904420', '1', 'gt543', 1, '[{\"added\": {}}]', 9, 1),
(4, '2024-06-14 22:57:03.229628', '1', 'Otro paquete', 2, '[{\"changed\": {\"fields\": [\"Numrastreo\"]}}]', 9, 1),
(5, '2024-06-15 01:19:27.780185', '1', 'Compras Recibidas / Sin clasificar', 1, '[{\"added\": {}}]', 11, 1),
(6, '2024-06-15 01:23:18.611633', '1', 'Compras recibidas', 1, '[{\"added\": {}}]', 12, 1),
(7, '2024-06-15 02:19:10.046922', '1', 'Miscelaneas', 1, '[{\"added\": {}}]', 7, 1),
(8, '2024-06-15 02:19:18.475607', '2', 'Aseo', 1, '[{\"added\": {}}]', 7, 1),
(9, '2024-06-15 02:19:32.493780', '3', 'Alimentación', 1, '[{\"added\": {}}]', 7, 1),
(10, '2024-06-15 02:19:42.268037', '1', 'Pasta de dientes', 1, '[{\"added\": {}}]', 8, 1),
(11, '2024-06-15 02:43:33.161048', '4', 'De todo', 3, '', 9, 1),
(12, '2024-06-15 02:43:59.611160', '3', 'Cintillo', 1, '[{\"added\": {}}]', 8, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(12, 'paqueteria', 'almacen'),
(11, 'paqueteria', 'categorialmacen'),
(7, 'paqueteria', 'categoriaproducto'),
(9, 'paqueteria', 'paquete'),
(8, 'paqueteria', 'productos'),
(10, 'paqueteria', 'usuario'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-06-13 12:46:23.122531'),
(2, 'auth', '0001_initial', '2024-06-13 12:46:34.428168'),
(3, 'admin', '0001_initial', '2024-06-13 12:46:36.864607'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-06-13 12:46:36.918043'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-06-13 12:46:37.019065'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-06-13 12:46:38.485817'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-06-13 12:46:40.353199'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-06-13 12:46:41.839733'),
(9, 'auth', '0004_alter_user_username_opts', '2024-06-13 12:46:41.940058'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-06-13 12:46:43.044227'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-06-13 12:46:43.121795'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-06-13 12:46:43.202858'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-06-13 12:46:43.442114'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-06-13 12:46:43.747121'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-06-13 12:46:45.138567'),
(16, 'auth', '0011_update_proxy_permissions', '2024-06-13 12:46:45.207235'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-06-13 12:46:45.454824'),
(18, 'sessions', '0001_initial', '2024-06-13 12:46:46.086020'),
(19, 'paqueteria', '0001_initial', '2024-06-13 18:25:37.533843'),
(20, 'paqueteria', '0002_usuario_first_name_usuario_last_name_and_more', '2024-06-14 00:04:30.969225'),
(21, 'paqueteria', '0003_alter_paquete_identificado', '2024-06-14 21:58:07.040176'),
(22, 'paqueteria', '0004_alter_usuario_telefono', '2024-06-14 22:19:33.293683'),
(23, 'paqueteria', '0005_alter_paquete_tienda_procedente', '2024-06-14 22:49:35.563816'),
(24, 'paqueteria', '0006_paquete_almacen_paquete_clasificacion', '2024-06-15 01:13:20.379439'),
(25, 'paqueteria', '0007_rename_categoriaproducto_productos_categprod', '2024-06-15 02:10:35.570495'),
(26, 'paqueteria', '0008_alter_paquete_id', '2024-06-15 02:55:55.868334'),
(27, 'paqueteria', '0009_alter_categorialmacen_id', '2024-06-15 03:30:27.007774');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('40bjrgcy7m6sjanblvpgtnfpgm3qslxt', '.eJxVjMsOwiAQRf-FtSEdyvBw6b7fQBgYpWogKe3K-O_apAvd3nPOfYkQt7WErfMS5izOAsTpd6OYHlx3kO-x3ppMra7LTHJX5EG7nFrm5-Vw_w5K7OVbJ6fBk_KULWBWRFabjOgQPaFi0FYZPaTBoEsMQKAxcRzd1RkzWlbi_QHEIjbr:1sHoNd:A483X3SxtBFfi25LZlF_B2nX_8i0pmFLrubywnOEPzM', '2024-06-27 17:36:57.401258');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete`
--

CREATE TABLE `paquete` (
  `id` int(11) NOT NULL,
  `numrastreo` varchar(100) NOT NULL,
  `fecha_compra` date DEFAULT NULL,
  `identificado` int(11) NOT NULL,
  `tienda_procedente` varchar(2000) DEFAULT NULL,
  `usuario_id` bigint(20) DEFAULT NULL,
  `almacen_id` bigint(20) DEFAULT NULL,
  `clasificacion` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `paquete`
--

INSERT INTO `paquete` (`id`, `numrastreo`, `fecha_compra`, `identificado`, `tienda_procedente`, `usuario_id`, `almacen_id`, `clasificacion`) VALUES
(1, 'Otro paquete', '2024-06-14', 2, 'Amazon', 1, NULL, NULL),
(2, 'gt543', '2024-06-14', 1, 'Amazon', 1, NULL, NULL),
(3, 'De todo', '2024-06-14', 1, 'Amazon', 1, NULL, NULL),
(5, 'De todo', '2024-06-14', 1, 'Amazon', 1, NULL, NULL),
(6, 'Paquete integro', '2024-06-15', 1, 'Amazon', 1, NULL, NULL),
(7, 'De todo again', '2024-06-14', 1, 'Amazon', 1, NULL, NULL),
(8, 'De todo again', '2024-06-14', 1, 'Amazon', 1, NULL, NULL),
(9, 'De todo again', '2024-06-14', 1, 'Amazon', 1, NULL, NULL),
(10, 'De todo again', '2024-06-14', 1, 'Amazon', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `categprod_id` bigint(20) NOT NULL,
  `paquete_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `categprod_id`, `paquete_id`) VALUES
(1, 'Pasta de dientes', 3, 1),
(2, 'Cepillo de dientes', 2, 1),
(3, 'Cintillo', 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` bigint(20) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `nro_cliente` varchar(100) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `direccion`, `ciudad`, `estado`, `telefono`, `nro_cliente`, `usuario_id`, `first_name`, `last_name`, `username`) VALUES
(1, 'cALLE 23 ENTRE 54 Y 46', 'Habana', 'Guanabacoa', '+53 542013254', '487', NULL, 'Maleta', 'GHJ', 'Liana');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `almacen_categoria_almaceb_id_d6a60449_fk` (`categoria_almaceb_id`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `categorialmacen`
--
ALTER TABLE `categorialmacen`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoriaproducto`
--
ALTER TABLE `categoriaproducto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paquete_usuario_id_82d988ab_fk_usuario_id` (`usuario_id`),
  ADD KEY `paquete_almacen_id_bcca46c8_fk_almacen_id` (`almacen_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_categprod_id_ddf3e459_fk_categoriaProducto_id` (`categprod_id`),
  ADD KEY `productos_paquete_id_baa58b3b_fk` (`paquete_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_usuario_id_806a6575_fk_auth_user_id` (`usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacen`
--
ALTER TABLE `almacen`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorialmacen`
--
ALTER TABLE `categorialmacen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categoriaproducto`
--
ALTER TABLE `categoriaproducto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `paquete`
--
ALTER TABLE `paquete`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD CONSTRAINT `almacen_categoria_almaceb_id_d6a60449_fk` FOREIGN KEY (`categoria_almaceb_id`) REFERENCES `categorialmacen` (`id`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD CONSTRAINT `paquete_almacen_id_bcca46c8_fk_almacen_id` FOREIGN KEY (`almacen_id`) REFERENCES `almacen` (`id`),
  ADD CONSTRAINT `paquete_usuario_id_82d988ab_fk_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_categprod_id_ddf3e459_fk_categoriaProducto_id` FOREIGN KEY (`categprod_id`) REFERENCES `categoriaproducto` (`id`),
  ADD CONSTRAINT `productos_paquete_id_baa58b3b_fk` FOREIGN KEY (`paquete_id`) REFERENCES `paquete` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_usuario_id_806a6575_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
