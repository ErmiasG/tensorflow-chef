name             "tensorflow"
maintainer       "Jim Dowling"
maintainer_email "jdowling@kth.se"
license          "Apache v2.0"
description      'Installs/Configures/Runs tensorflow'
version          "0.6.0"

recipe            "tensorflow::install", "Download and compile and install tensorflow"
recipe            "tensorflow::default",  "Setup tensorflow"
recipe            "tensorflow::serving",  "Install tensorflow serving"
recipe            "tensorflow::purge",  "Uninstall tensorflow and cuda"


depends "kagent"
depends "java"
depends "magic_shell"
depends "ndb"
depends "hops"

%w{ ubuntu debian rhel centos }.each do |os|
  supports os
end


attribute "tensorflow/user",
          :description => "user parameter value",
          :type => "string"

attribute "tensorflow/group",
          :description => "group parameter value",
          :type => "string"

attribute "tensorflow/dir",
          :description => "Base installation directory",
          :type => "string"

attribute "download_url",
          :description => "url for binaries",
          :type => "string"

attribute "tensorflow/git_url",
          :description => "url for git sourcecode for tensorflow",
          :type => "string"

attribute "tensorflow/install",
          :description => "'src' to compile/install from source code. 'dist' to install from binaries. ",
          :type => "string"

attribute "tensorflow/mpi",
          :description => "'true' to install openmpi support, 'false' (default) for no MPI support. ",
          :type => "string"

attribute "tensorflow/mkl",
          :description => "'true' to install Intel MKL support, 'false' (default) for no support. ",
          :type => "string"

attribute "tensorflow/rdma",
          :description => "Used by TensorflowOnSpark. 'true' to install rdma (infiniband) support, 'false' (default) for no rdma support. ",
          :type => "string"

attribute "tensorflow/tensorrt",
          :description => "TensorRT is used to optimize trained models and Needs GPU support and Cuda",
          :type => "string"

attribute "tensorflow/custom_url",
          :description => "User-supplied URL for the tensorflow .whl binaries to be installed.",
          :type => "string"

attribute "install/dir",
          :description => "Set to a base directory under which we will install.",
          :type => "string"

attribute "install/user",
          :description => "User to install the services as",
          :type => "string"

attribute "cuda/accept_nvidia_download_terms",
          :description => "Accept cuda licensing terms and conditions. Default: 'false'. Change to 'true' to enable cuda.",
          :type => "string"

attribute "cuda/skip_test",
          :description => "Dont check if there is a local nvidia card on this machine",
          :type => "string"

attribute "cuda/skip_stop_xserver",
          :description => "Dont restart the xserver (probably a localhost installation)",
          :type => "string"

### MPI service
attribute "mpi/mpirun_exec",
          :description => "mpirun executable. Default '/usr/bin/mpirun'.",
          :type => 'string'
attribute "mpi/base_dir",
          :description => "MPI service dir. Default '/srv/hops/mpi'.",
          :type => 'string'
attribute "mpi/log_dir",
          :description => "MPI service log dir. Default '/srv/hops/mpi/logs'.",
          :type => 'string'
attribute "mpi/run_dir",
          :description => "MPI service run dir. Default '/srv/hops/mpi/run'.",
          :type => 'string'
attribute "mpi/example_dir",
          :description => "MPI service examples dir. Default '/srv/hops/mpi/examples'.",
          :type => 'string'
attribute "mpi/host_file",
          :description => "MPI service host file. Default '/srv/hops/mpi/hostFile'.",
          :type => 'string'
attribute "mpi/hosts",
          :description => "MPI service hosts file content. Default '[]'.",
          :type => 'string'
attribute "mpi/log_retention",
          :description => "MPI service log retention. Default '90 days'.",
          :type => 'string'
attribute "mpi/ps_term_wait",
          :description => "MPI service ps termination wait. Default '5 sec'.",
          :type => 'string'
attribute "mpi/log_cleanup_interval",
          :description => "MPI service log cleanup interval. Default '1440 min'.",
          :type => 'string'
attribute "mpi/ps_monitoring_interval",
          :description => "MPI service ps monitoring interval. Default '60 min'.",
          :type => 'string'
attribute "mpi/resource_monitoring_interval",
          :description => "MPI service resource monitoring interval. Default '5 min'.",
          :type => 'string'
attribute "mpi/max_log_size_to_send",
          :description => "MPI service max log size to send. Default '5Mb'.",
          :type => 'string'