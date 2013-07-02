# make sure optipng for png optimization is installed
class optipng {
    package {
        "optipng":
            ensure => installed,
    }
}