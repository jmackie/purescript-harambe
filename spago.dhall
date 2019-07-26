{ name =
    "my-project"
, dependencies =
    [ "effect", "web-html", "aff", "aff-promise" ]
, packages =
    ./packages.dhall
, sources =
    [ "src/**/*.purs" ]
}
