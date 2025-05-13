# create users

resource "aws_iam_user" "u1" {
    name = "tony"
}

resource "aws_iam_user" "u2" {
    name = "steve"
}

resource "aws_iam_user" "u3" {
    name = "natasha"
}

resource "aws_iam_user" "u4" {
    name = "client"
}

resource "aws_iam_user" "u5" {
    name = "bruce"
}
resource "aws_iam_user" "u6" {
    name = "thor"
}

# create group

resource "aws_iam_group" "g1" {
    name = "avengers"
}

# add users to group avengers

resource "aws_iam_group_membership" "m1"{
    name = "team"

    users = [
        aws_iam_user.u1.name,
        aws_iam_user.u2.name,
        aws_iam_user.u3.name,
        aws_iam_user.u4.name,
        aws_iam_user.u5.name,
        aws_iam_user.u6.name
    ]

    group = aws_iam_group.g1.name
}
