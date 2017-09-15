<!DOCTYPE html>
<!-- TEMPLATE FILE: [% template.name.split('/').last %] -->

[% USE Koha %]
[% IF Koha.Preference('DumpTemplateVarsOpac') %]
    [% TRY %]
        [% USE Stash %]
        [% USE Dumper %]
        <!--
        [% FILTER replace('<!--', '<!- -') %]
            [% FILTER replace('-->', '- ->') %]
                [% Dumper.dump( Stash.stash() ) %]
            [% END %]
        [% END %]
        -->
    [% CATCH %]
        <!--
            DumpTemplateVarsOpac is set to 'Do', but
            Template::Plugin::Stash is not installed.
        -->
    [% END %]
[% END %]

[% IF ( bidi ) %]<html lang="[% lang %]" dir="[% bidi %]" class="no-js">[% ELSE %]<html lang="[% lang %]" class="no-js">[% END %]
<head>
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-59T5JN');</script>
<!-- End Google Tag Manager -->
