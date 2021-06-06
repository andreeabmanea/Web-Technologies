<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitb3bd72a5293b5ef36b8a7a18c9564e61
{
    public static $prefixLengthsPsr4 = array (
        'P' => 
        array (
            'PHPMailer\\PHPMailer\\' => 20,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'PHPMailer\\PHPMailer\\' => 
        array (
            0 => __DIR__ . '/..' . '/phpmailer/phpmailer/src',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitb3bd72a5293b5ef36b8a7a18c9564e61::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitb3bd72a5293b5ef36b8a7a18c9564e61::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInitb3bd72a5293b5ef36b8a7a18c9564e61::$classMap;

        }, null, ClassLoader::class);
    }
}
