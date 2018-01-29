# çPhp Test Code


## phpmd - PHP Mess Detector: PHPMD

```bash
phpmd /path/to/source text codesize,unusedcode,naming

# Opciones
cleancode,codesize,controversial,design,naming,unusedcode

# Ejemplos
 phpmd application/controllers/ text cleancode > ~/Downloads/errores_prototiposena/cleancode.txt

 phpmd application/controllers/ text codesize > ~/Downloads/errores_prototiposena/codesize.txt

 phpmd application/controllers/ text controversial > ~/Downloads/errores_prototiposena/controversial.txt

 phpmd application/controllers/ text design > ~/Downloads/errores_prototiposena/design.txt

 phpmd application/controllers/ text naming > ~/Downloads/errores_prototiposena/naming.txt

 phpmd application/controllers/ text unusedcode > ~/Downloads/errores_prototiposena/unusedcode.txt
```

## phpdcd


## phpcpd

```bash
phpcpd application/controllers/ > ~/Downloads/errores_prototiposena/copyPaste_controllers.txt

phpcpd application/views/ > ~/Downloads/errores_prototiposena/copyPaste_views.txt
```

## phpcs

```bash
# INSTALL
$ sudo pear install PHP_CodeSniffer

# Example
$ phpcs application/controllers/ > ~/Downloads/errores_prototiposena/phpcs_controlles.txt
$ phpcs application/views/ > ~/Downloads/errores_prototiposena/phpcs_views.txt
```
