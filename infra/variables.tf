variable "app_name" {
    default = "videoStreamingAlpha"
}

variable location {
    default = "West US"
}

variable admin_username {
    default = "linux_admin"
}

variable app_version { # Can't be called version! That's a reserved word.
}

variable client_id {

}

variable client_secret {

}

variable storage_account_name {
}

variable storage_access_key {
}

variable rabbit_url {
    default = "amqp://guest:guest@rabbit:5672"
}

variable database_url {
    default = "mongodb://db:27017"
}