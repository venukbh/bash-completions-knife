
__knife() {
  local i=1 cmd
  # find the subcommand
  while [[ "$i" -lt "$COMP_CWORD" ]]
  do
    local s="${COMP_WORDS[i]}"
    case "$s" in
      *)
        cmd="$s"
        break
        ;;
    esac
    (( i++ ))
  done

  COMPREPLY=()
  case "$cmd" in
    "")             __knife_complete_sub_commands ;;
    acl)            __knife_complete_acl ;;
    bootstrap)      __knife_complete_bootstrap ;;
    client)         __knife_complete_client ;;
    config)         __knife_complete_config ;;
    configure)      __knife_complete_configure ;;
    cookbook)       __knife_complete_cookbook ;;
    data)           __knife_complete_data ;;
    delete)         __knife_complete_single_command ;;
    deps)           __knife_complete_single_command ;;
    diff)           __knife_complete_single_command ;;
    download)       __knife_complete_single_command ;;
    ec2)            __knife_complete_ec2 ;;
    edit)           __knife_complete_single_command ;;
    environment)    __knife_complete_environment ;;
    exec)           __knife_complete_single_command ;;
    google)         __knife_complete_google ;;
    group)          __knife_complete_group ;;
    job)            __knife_complete_job ;;
    list)           __knife_complete_single_command ;;
    node)           __knife_complete_node ;;
    null)           __knife_complete_single_command ;;
    opc)            __knife_complete_opc ;;
    osc_user)       __knife_complete_osc_user ;;
    raw)            __knife_complete_single_command ;;
    recipe)         __knife_complete_single_command ;;
    rehash)         __knife_complete_single_command ;;
    role)           __knife_complete_role ;;
    search)         __knife_complete_single_command ;;
    serve)          __knife_complete_single_command ;;
    show)           __knife_complete_single_command ;;
    spork)          __knife_complete_spork ;;
    ssh)            __knife_complete_single_command ;;
    ssl)            __knife_complete_ssl ;;
    status)         __knife_complete_single_command ;;
    supermarket)    __knife_complete_supermarket ;;
    tag)            __knife_complete_tag ;;
    tidy)           __knife_complete_tidy ;;
    upload)         __knife_complete_single_command ;;
    user)           __knife_complete_user ;;
    vault)          __knife_complete_vault ;;
    vsphere)        __knife_complete_vsphere ;;
    windows)        __knife_complete_windows ;;
    winrm)          __knife_complete_winrm ;;
    wsman)          __knife_complete_wsman ;;
    xargs)          __knife_complete_xargs ;;
  esac
}

# takes 1 parameter containing additional options list = $1
__knife_complete_default_and_additional_options() {
  # total default options = 32
  local default_options="-c --config --chef-zero-host --chef-zero-port -d --disable-editing --defaults"
        default_options="${default_options} -e --editor -E --environment -F --format -h --help"
        default_options="${default_options} -k --key --[no-]color --[no-]fips --print-after -s --server-url"
        default_options="${default_options} -u --user -v --version -V --verbose -y --yes -z --local-mode"
  COMPREPLY=($(compgen -W "$1 ${default_options}" -- "${COMP_WORDS[COMP_CWORD]}"))
}


# list of knife sub commands. This will be invoked when only knife command is entered
__knife_complete_sub_commands() {
  local sub_commands="acl bootstrap client config configure cookbook data delete deps diff download ec2 edit environment exec google group job list node null opc osc_user raw recipe rehash role search serve show spork ssh ssl status supermarket tag tidy upload user vault vsphere windows winrm wsman xargs"
  local current_word=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=($(compgen -W "${sub_commands}" -- "${current_word}"))
}

# completed
__knife_complete_acl() {
  local sub_commands=""
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      sub_commands="add bulk remove show"
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
    3)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        bulk)
              sub_commands="add remove"
              __knife_complete_default_and_additional_options "${sub_commands} ${options}"
              ;;
        *)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
      esac
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

# completed
__knife_complete_bootstrap() {
  local sub_commands=""
  local options="-A --forward-agent --bootstrap-curl-options --bootstrap-install-command --bootstrap-no-proxy"
        options="${options} --bootstrap-preinstall-command --bootstrap-proxy-pass --bootstrap-proxy-user"
        options="${options} --bootstrap-proxy --bootstrap-vault-file --bootstrap-vault-item --bootstrap-vault-json"
        options="${options} --bootstrap-version --bootstrap-wget-options -E --environment -G --ssh-gateway --hint"
        options="${options} -i --ssh-identity-file -j --json-attributes --json-attribute-file -N --node-name"
        options="${options} --[no-]fips --[no-]host-key-verify --[no-]node-verify-api-cert --node-ssl-verify-mode"
        options="${options} -p --ssh-port -P --ssh-password --prerelease -r --run-list --secret --secret-file"
        options="${options} --sudo --sudo-preserve-home -t --bootstrap-template --use-sudo-password -V -x --ssh-user"
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      sub_commands="windows"
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
    3)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        windows)
          sub_commands="ssh winrm"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        *)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
      esac
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

# pending
# completed_till_delete_need_to continue from key
# https://github.com/chef/chef-web-docs/blob/master/chef_master/source/knife_client.rst
__knife_complete_client() {
  local sub_commands=""
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      sub_commands="bulk create delete edit key list reregister show"
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
    3)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        bulk)
          sub_commands="delete"
          options="-D --delete-validators"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        create)
          options="-a --admin -f --file -k --prevent-keygen -p --public-key --validator"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        delete)
          options="-D --delete-validators"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        key)
          sub_commands="create delete edit list show"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        *)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
      esac
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

# completed
__knife_complete_config() {
  local sub_commands=""
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      sub_commands="get get-profile list-profiles use-profile"
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      # COMPREPLY=($(compgen -W "${sub_commands}" -- "${COMP_WORDS[COMP_CWORD]}"))
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

# completed
__knife_complete_configure() {
  local sub_commands=""
  local options="--admin-client-name --admin-client-key -i --initial -r --repository --validation-client-name --validation-key"
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      sub_commands="client"
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

# completed
__knife_complete_cookbook() {
  local sub_commands=""
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      sub_commands="bulk create delete download list metadata show test upload"
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
    3)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        bulk)
          sub_commands="delete"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        create)
          options="-C --copyright -I --license -m --email -o --cookbook-path -r --readme-format"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        delete)
          options="-a --all -p --purge"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        download)
          options="-d --dir -f --force -N --latest"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        list)
          options="-a --all -w --with-uri"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        metadata)
          options="-a --all -o --cookbook-path"
          sub_commands="from"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        show)
          options="-f --fqdn -p --platform -V --platform-version -w --with-uri"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        test)
          options="-a --all -o --cookbook-path"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        upload)
          options="-a --all --concurrency -d --include-dependencies -E --environment --force --freeze -o --cookbook-path"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
      esac
      ;;
    4)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        delete)
          options="-p --purge"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
      esac
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

# completed
__knife_complete_data() {
  local sub_commands=""
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      sub_commands="bag"
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
    3)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        bag)
          sub_commands="create delete edit from list show"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
      esac
      ;;
    4)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        create)
          options="--secret --secret-file"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        delete)
          options=""
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        edit)
          options="--secret --secret-file"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        from)
          sub_commands="file"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        list)
          options="-w --with-uri"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        show)
          options="-w --with-uri"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
      esac
      ;;
    5)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        file)
          options="-a --all --secret --secret-file"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
      esac
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

# completed
__knife_complete_ec2() {
  COMPREPLY=()
  local options=""
  local sub_commands=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      sub_commands="ami amis flavor server"
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
    3)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        ami)
          sub_commands="list"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        amis)
          sub_commands="ubuntu"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        flavor)
          sub_commands="list"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        server)
          sub_commands="create delete list"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
      esac
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

# completed
__knife_complete_environment() {
  COMPREPLY=()
  local sub_commands=""
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      sub_commands="compare create delete edit from list show"
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
    3)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        compare)
          options="-a --all -m --mismatch"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        create)
          options="--description"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        from)
          sub_commands="file"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        list)
          options="-w --with-uri"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        show)
          options="-a --attribute"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        *)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
      esac
      ;;
    4)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        file)
          options="-a --all"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
      esac
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

# completed
__knife_complete_opc() {
  COMPREPLY=()
  local sub_commands=""
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      sub_commands="org user"
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
    3)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        org)
          sub_commands="list show create delete user"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        user)
          sub_commands="list show create delete edit password"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
      esac
      ;;
    4)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        list)
          options="-w --with-uri"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        show)
          options="-l --with-orgs"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        create)
          options="-f --filename"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        delete)
          options="-d --no-disassociate-user -R --remove-from-admin-groups"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        user)
          sub_commands="add remove"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
      esac
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

# completed
__knife_complete_node() {
  COMPREPLY=()
  local sub_commands=""
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      sub_commands="bulk create delete edit environment from list policy run_list show"
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
    3)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        bulk)
          sub_commands="delete"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        environment)
          sub_commands="set"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        from)
          sub_commands="file"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        policy)
          sub_commands="set"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        run_list)
          sub_commands="add remove set"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        edit)
          options="-a --all"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        list)
          options="-w --with-uri"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        show)
          options="-a --attribute -F --format=json -l --long -m --medium -r --run-list"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
      esac
      ;;
    4)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        add)
          options="-a --after -b --before"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
      esac
      ;;
    esac
  # local sub_commands="bulk create delete edit environment from list policy run_list run_list run_list show status"
  # ${#ArrayName[@]} to get the length of the array
  # echo "${#COMP_WORDS[@]}" # total words in the line
  # echo $COMP_CWORD #current cursor position
  # COMPREPLY=($(compgen -W "${sub_commands}" -- "${current_word}"))
  # if the length of $COMP_CWORD is 2 only then it means its node command only is present and empty space
  # local current_word=${COMP_WORDS[COMP_CWORD]}
  # # echo "$i"
  # case "${COMP_WORDS[COMP_CWORD]}" in
  #   "") COMPREPLY=($(compgen -W "${sub_commands}" -- "${COMP_WORDS[COMP_CWORD]}")) ;;
  # esac
  # echo $((${#COMP_WORDS[@]} - 1))

  # local options=""
  # case $((${#COMP_WORDS[@]} - 1)) in
  #   2)
  #     __knife_complete_default_and_additional_options "${sub_commands} ${options}"
  #     # COMPREPLY=($(compgen -W "${sub_commands}" -- "${COMP_WORDS[COMP_CWORD]}"))
  #     ;;
  #   3)
  #     # echo "yes"
  #     # echo "${COMP_WORDS[COMP_CWORD - 1]}"
  #     case "${COMP_WORDS[COMP_CWORD - 1]}" in
  #       bulk)
  #         __knife_complete_default_and_additional_options "${sub_commands} ${options}"
  #         # COMPREPLY=($(compgen -W "delete"))
  #         ;;
  #       environment)
  #         __knife_complete_default_and_additional_options "${sub_commands} ${options}"
  #         # COMPREPLY=($(compgen -W "set" -- "${COMP_WORDS[COMP_CWORD]}"))
  #         ;;
  #       from)
  #         __knife_complete_default_and_additional_options "${sub_commands} ${options}"
  #         # COMPREPLY=($(compgen -W "file" -- "${COMP_WORDS[COMP_CWORD]}"))
  #         ;;
  #       policy)
  #         __knife_complete_default_and_additional_options "${sub_commands} ${options}"
  #         # COMPREPLY=($(compgen -W "set" -- "${COMP_WORDS[COMP_CWORD]}"))
  #         ;;
  #       run_list)
  #         __knife_complete_default_and_additional_options "${sub_commands} ${options}"
  #         # COMPREPLY=($(compgen -W "add remove set" -- "${COMP_WORDS[COMP_CWORD]}"))
  #         ;;
  #     esac
  #     ;;
  #   *)
  #     __knife_complete_default_and_additional_options "${sub_commands} ${options}"
  #     ;;
  # esac
}

# pending
# https://github.com/chef/knife-google
__knife_complete_google() {
  COMPREPLY=()
  local sub_commands="disk project region server zone"
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      # COMPREPLY=($(compgen -W "${sub_commands}" -- "${COMP_WORDS[COMP_CWORD]}"))
      ;;
    3)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        disk)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          # COMPREPLY=($(compgen -W "create delete list" -- "${COMP_WORDS[COMP_CWORD]}"))
          ;;
        region)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          # COMPREPLY=($(compgen -W "list quotas" -- "${COMP_WORDS[COMP_CWORD]}"))
          ;;
        servers)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          # COMPREPLY=($(compgen -W "create delete list show" -- "${COMP_WORDS[COMP_CWORD]}"))
          ;;
        zone)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          # COMPREPLY=($(compgen -W "show" -- "${COMP_WORDS[COMP_CWORD]}"))
          ;;
      esac
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

# pending
__knife_complete_group() {
  COMPREPLY=()
  local sub_commands="add create destroy list remove show"
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      # COMPREPLY=($(compgen -W "${sub_commands}" -- "${COMP_WORDS[COMP_CWORD]}"))
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

# pending
__knife_complete_job() {
  COMPREPLY=()
  local sub_commands="list output start status"
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      # COMPREPLY=($(compgen -W "${sub_commands}" -- "${COMP_WORDS[COMP_CWORD]}"))
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

# pending
__knife_complete_osc_user() {
  COMPREPLY=()
  local sub_commands="create delete edit list reregister show"
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      # COMPREPLY=($(compgen -W "${sub_commands}" -- "${COMP_WORDS[COMP_CWORD]}"))
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

# completed
__knife_complete_role() {
  COMPREPLY=()
  local sub_commands=""
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      sub_commands="bulk create delete edit from list show"
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
    3)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        bulk)
          sub_commands="delete"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        from)
          sub_commands="file"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
      esac
      ;;
    4)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        create)
          options="--description"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        list)
          options="-w --with-uri"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        show)
          options="-a --attribute"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
      esac
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

# completed
__knife_complete_spork() {
  COMPREPLY=()
  local sub_commands=""
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      sub_commands="bump check data environment info node omni promote role upload"
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
    3)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        data)
          sub_commands="bag"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        environment)
          sub_commands="check"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
      esac
      ;;
  esac
}

# completed
__knife_complete_ssl() {
  COMPREPLY=()
  local sub_commands=""
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      sub_commands="check"
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

# completed
__knife_complete_supermarket() {
  COMPREPLY=()
  local sub_commands=""
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      sub_commands="download install list search share show unshare"
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
    3)
      case $((${#COMP_WORDS[@]} - 1)) in
        download)
          options="-f --file --force -m --supermarket-site"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        install)
          options="-b --use-current-branch -B --branch -D --skip-dependencies -m --supermarket-site -o --cookbook-path"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        list)
          options="-m --supermarket-site -w --with-uri"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        search)
          options="-m --supermarket-site"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        share)
          options="-m --supermarket-site -o --cookbook-path"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        show)
          options="-m --supermarket-site"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        unshare)
          options="-m --supermarket-site"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        esac
        ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

# completed
__knife_complete_tag() {
  COMPREPLY=()
  local sub_commands=""
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      sub_commands="create delete list"
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

# pending
__knife_complete_tidy() {
  COMPREPLY=()
  local sub_commands="backup notify server"
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      # COMPREPLY=($(compgen -W "${sub_commands}" -- "${COMP_WORDS[COMP_CWORD]}"))
      ;;
    3)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        server)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          # COMPREPLY=($(compgen -W "clean report" -- "${COMP_WORDS[COMP_CWORD]}"))
          ;;
      esac
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

# completed
__knife_complete_user() {
  COMPREPLY=()
  local sub_commands=""
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      sub_commands="create delete edit key list reregister show"
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
    3)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        create)
          options="-a --admin -f --file -p --password --user-key"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        key)
          sub_commands="create delete edit list show"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        list)
          options="-w --with-uri"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        reregister)
          options="-f --file"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        show)
          options="-a --attribute"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
      esac
      ;;
    4)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        create)
          options="-e --expiration-date -f --file -k --key-name -p --public-key"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        edit)
          options="-c --create-key -e --expiration-date -f --file -k --key-name -p --public-key"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
        list)
          options="-e --only-expired -n --only-non-expired -w --with-details"
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          ;;
      esac
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

# pending
__knife_complete_vault() {
  COMPREPLY=()
  local sub_commands="create delete download edit isvault itemtype list refresh remove rotate show"
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      # COMPREPLY=($(compgen -W "${sub_commands}" -- "${COMP_WORDS[COMP_CWORD]}"))
      ;;
    3)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        rotate)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          # COMPREPLY=($(compgen -W "all keys" -- "${COMP_WORDS[COMP_CWORD]}"))
          ;;
      esac
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
    esac
}

# pending
__knife_complete_vsphere() {
  COMPREPLY=()
  local sub_commands="cluster cpu customization datastore datastorecluster folder hosts pool template vlan vm"
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      # COMPREPLY=($(compgen -W "${sub_commands}" -- "${COMP_WORDS[COMP_CWORD]}"))
      ;;
    3)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        cluster)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          # COMPREPLY=($(compgen -W "list" -- "${COMP_WORDS[COMP_CWORD]}"))
          ;;
        cpu)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          # COMPREPLY=($(compgen -W "ratio" -- "${COMP_WORDS[COMP_CWORD]}"))
          ;;
        customization)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          # COMPREPLY=($(compgen -W "list" -- "${COMP_WORDS[COMP_CWORD]}"))
          ;;
        datastore)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          # COMPREPLY=($(compgen -W "file list maxfree" -- "${COMP_WORDS[COMP_CWORD]}"))
          ;;
        datastorecluster)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          # COMPREPLY=($(compgen -W "list maxfree" -- "${COMP_WORDS[COMP_CWORD]}"))
          ;;
        folder)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          # COMPREPLY=($(compgen -W "list" -- "${COMP_WORDS[COMP_CWORD]}"))
          ;;
        hosts)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          # COMPREPLY=($(compgen -W "list" -- "${COMP_WORDS[COMP_CWORD]}"))
          ;;
        pool)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          # COMPREPLY=($(compgen -W "list query show" -- "${COMP_WORDS[COMP_CWORD]}"))
          ;;
        template)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          # COMPREPLY=($(compgen -W "list" -- "${COMP_WORDS[COMP_CWORD]}"))
          ;;
        vlan)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          # COMPREPLY=($(compgen -W "create list" -- "${COMP_WORDS[COMP_CWORD]}"))
          ;;
        vm)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          # COMPREPLY=($(compgen -W "cdrom clone config delete disk execute find list markastemplate migrate move net network property show snapshot state toolsconfig vmdk vncset wait" -- "${COMP_WORDS[COMP_CWORD]}"))
          ;;
      esac
      ;;
    4)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        disk)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          # COMPREPLY=($(compgen -W "extend list" -- "${COMP_WORDS[COMP_CWORD]}"))
          ;;
        network)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          # COMPREPLY=($(compgen -W "add delete list set" -- "${COMP_WORDS[COMP_CWORD]}"))
          ;;
        property)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          # COMPREPLY=($(compgen -W "get set" -- "${COMP_WORDS[COMP_CWORD]}"))
          ;;
      esac
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

# pending
__knife_complete_windows() {
  COMPREPLY=()
  local sub_commands="cert listener"
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      # COMPREPLY=($(compgen -W "${sub_commands}" -- "${COMP_WORDS[COMP_CWORD]}"))
      ;;
    3)
      case "${COMP_WORDS[COMP_CWORD - 1]}" in
        cert)
          __knife_complete_default_and_additional_options "${sub_commands} ${options}"
          # COMPREPLY=($(compgen -W "generate install" -- "${COMP_WORDS[COMP_CWORD]}"))
          ;;
      esac
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
    esac
}

# pending
__knife_complete_winrm() {
  COMPREPLY=()
  local sub_commands=""
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      # COMPREPLY=($(compgen -W "${sub_commands}" -- "${COMP_WORDS[COMP_CWORD]}"))
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

# pending
__knife_complete_wsman() {
  COMPREPLY=()
  local sub_commands="test"
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      # COMPREPLY=($(compgen -W "${sub_commands}" -- "${COMP_WORDS[COMP_CWORD]}"))
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

# completed
__knife_complete_xargs() {
  COMPREPLY=()
  local sub_commands=""
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      options="-0 --chef-repo-path --concurrency --[no-]diff --dry-run --[no-]force -I --replace -J --replace-first --local -n --max-args -p --pattern --repo-mode -s --max-chars -t"
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
    esac
}

__knife_complete_single_command() {
  COMPREPLY=()
  local sub_commands=""
  local options=""
  case $((${#COMP_WORDS[@]} - 1)) in
    2)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      # COMPREPLY=($(compgen -W "${sub_commands}" -- "${COMP_WORDS[COMP_CWORD]}"))
      ;;
    *)
      __knife_complete_default_and_additional_options "${sub_commands} ${options}"
      ;;
  esac
}

complete -o default -F __knife knife
