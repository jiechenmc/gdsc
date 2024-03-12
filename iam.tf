provider "google" {
  project = "gdsc-416923"
  region  = "us-east1"
}

resource "google_project_iam_policy" "project" {
  project     = "gdsc-416923"
  policy_data = data.google_iam_policy.admin.policy_data
}

resource "google_project_iam_custom_role" "student" {
  role_id     = "student"
  title       = "student"
  description = "student"
  permissions = ["iam.roles.list", "iam.roles.create", "iam.roles.delete"]
}


data "google_iam_policy" "admin" {
  binding {
    role = "roles/owner"

    members = [
      "user:jiechenmc@gmail.com",
    ]
  }

  binding {
    role = google_project_iam_custom_role.student.id

    members = [
      "user:wangeric639@gmail.com",
    ]
  }
}

