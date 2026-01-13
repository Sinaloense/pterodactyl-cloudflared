# pterodactyl-cloudflared
Dockerfile y Egg para correr Cloudflare Tunnel dentro de un servidor Pterodactyl.

Este repositorio provee lo necesario para integrar un túnel de Cloudflare (cloudflared) en tu servidor Pterodactyl, permitiendo exponer servicios de forma segura sin necesidad de abrir puertos directamente en tu firewall o router.

## Contenido del repositorio:

- Dockerfile — Imagen con cloudflared y scripts necesarios.
- entrypoint.sh — Script de arranque.
- egg-cloudflared.json — Egg para usar en Pterodactyl.
- logrotate.d — Configuración de rotación de logs para cloudflared.

## Características

- Integración de Cloudflare Tunnel directamente desde un servidor administrado por Pterodactyl.
- Permite exponer servicios sin abrir puertos.
- Compatible con eggs personalizados.
- Logs rotados automáticamente.
- Versión de Cloudflared: 2025.11.1.

## Requisitos:

- Pterodactyl instalado.
- Cuenta de Cloudflare.

## Instalación:

- Carga egg-cloudflared.json en tu panel.
- Subir archivo [pterodactyl-cloudflared](https://github.com/Sinaloense/pterodactyl-cloudflared/blob/main/logrotate.d/pterodactyl-cloudflared) en el directorio /etc/logrotate.d/ de tu host principal.

## Crear un tunnel cloudflare:

- https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/get-started/create-remote-tunnel/

## Crear servidor cloudflared

- Al crear tu servidor cloudflared solo debe copiar el token de tu tunnel y colocarlo en TOKEN.
- Al momento de crear una ruta en tu tunnel cloudflare, en tipo de servicio ingresa HTTP y en URL ingresa IP:PUERTO:
    ```
    Si a tu servidor le asignaste IPV6: [fd7a:3c91:b0e4:9f12:6a3d:84c1:2e9b:5f77]:8001
    Si a tu servidor le asignaste IPV4: 192.168.0.1:8001

    Recomiendo usar IPs locales, puedes crear en tu host principal una cantidad de IPv6 o IPV4 locales, y dentro de Pteordactyl asignarle una IP local a cada usuario,
    ese mismo usuario puedes asignarle sus servicios HTTP con la IP local que le asignaste a el, solo cambias el puerto.
    ```
    ![Descripción](images/1.png)

    ![Descripción](images/2.png)
    
    ![Descripción](images/3.png)