{ name =
    "my-project"
, dependencies =
    [ "effect"
    , "web-html"
    , "web-uievents"
    , "web-touchevents"
    , "web-clipboard"
    , "aff"
    , "aff-promise"
    ]
, packages =
    ./packages.dhall
, sources =
    [ "src/**/*.purs" ]
}
