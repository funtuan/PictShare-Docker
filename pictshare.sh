#!/bin/bash

echo "Setting up PictShare"

if [ -v ${TITLE} ]; then
		TITLE="PictShare"
fi

if [ -v ${MASTERDELETECODE} ]; then
		MASTERDELETECODE=""
fi

if [ -v ${BLOATING} ]; then
		BLOATING="false"
fi


if [ -v ${UPLOADCODE} ]; then
		UPLOADCODE=""
fi


if [ -v ${UPLOADPATH} ]; then
		UPLOADPATH=""
fi


if [ -v ${LOWPROFILE} ]; then
		LOWPROFILE="false"
fi


if [ -v ${IMAGECHANGECODE} ]; then
		IMAGECHANGECODE=""
fi


if [ -v ${LOGUPLOADER} ]; then
		LOGUPLOADER="false"
fi

if [ -v ${MAXRESIZEDIMAGES} ]; then
		MAXRESIZEDIMAGES="-1"
fi

if [ -v ${DOMAIN} ]; then
		DOMAIN=""
fi

if [ -v ${SHOWERRORS} ]; then
		SHOWERRORS="false"
fi


echo "<?php " > /opt/pictshare/inc/config.inc.php
echo "define('TITLE', '${TITLE}');" >> /opt/pictshare/inc/config.inc.php
echo "define('MASTER_DELETE_CODE', '${MASTERDELETECODE}');" >> /opt/pictshare/inc/config.inc.php
echo "define('UPLOAD_FORM_LOCATION', '${UPLOADPATH}');" >> /opt/pictshare/inc/config.inc.php
echo "define('LOW_PROFILE', ${LOWPROFILE});" >> /opt/pictshare/inc/config.inc.php
echo "define('UPLOAD_CODE', '${UPLOADCODE}');" >> /opt/pictshare/inc/config.inc.php
echo "define('IMAGE_CHANGE_CODE', '${IMAGECHANGECODE}');" >> /opt/pictshare/inc/config.inc.php
echo "define('LOG_UPLOADER', ${LOGUPLOADER});" >> /opt/pictshare/inc/config.inc.php
echo "define('MAX_RESIZED_IMAGES',${MAXRESIZEDIMAGES});" >> /opt/pictshare/inc/config.inc.php
echo "define('ALLOW_BLOATING', ${BLOATING});" >> /opt/pictshare/inc/config.inc.php
echo "define('FORCE_DOMAIN', '${DOMAIN}');" >> /opt/pictshare/inc/config.inc.php
echo "define('SHOW_ERRORS', ${SHOWERRORS});" >> /opt/pictshare/inc/config.inc.php

service php5-fpm start && nginx

touch /var/log/nginx/access.log
tail -f /var/log/nginx/access.log