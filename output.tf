output "control_plane_user_data" {
  value = data.cloudinit_config.control_plane.rendered
}

output "worker_plane_user_data" {
  value = data.cloudinit_config.worker_plane.rendered
}

output "worker_plane_startup_script" {
  value = data.cloudinit_config.worker_plane_startup_script.rendered
}

output "monitoring_user_data" {
  value = data.cloudinit_config.monitoring.rendered
}
