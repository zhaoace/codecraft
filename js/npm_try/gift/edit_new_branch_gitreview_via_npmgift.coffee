git = require "gift"
replace = require "replace"


# utils
{exec} = require 'child_process'
p = (x) -> console.log x
s = {}  #results
# utils

info = {}
info.info        = "Default info."
info.from_branch = "feat_50"
info.to_branch   = "feat_zhaoli03"
info.owner       = "Li Zhao"
info.git_dir     = 'C:/git/leandi/cvom_html'

# https://git.wdf.sap.corp:8080/#/admin/projects/SV/cvom.html,branches



repo = git info.git_dir



clean_repo = (info, callback) ->
    p "clean_repo called with '#{info.info}'"
    p repo.add "*" , (err) ->
        p repo.reset "HEAD" , { hard: true } , (err) ->
            return callback err if err?
            return callback null


fetch_remote = (info, callback) ->
    p "fetch_remote called with '#{info.info}'"
    p repo.remote_fetch "origin" , (err, msg) ->
        return callback err if err?
        return callback null


clean_local_branches = (info, callback) ->
    p "clean_local_branches called with '#{info.info}'"
    p repo.branches (err,branches) ->
        for branch in branches
            if branch.name != 'master'
                p repo.delete_branch "'#{branch.name}'" , (err, msg) ->
                    return null



update_gitreview = (info, callback) ->
    p "update_gitreview called with '#{info.info}'"
    replace({
        regex: "defaultbranch=.*",
        replacement: "defaultbranch=#{info.to_branch}",
        paths: ["#{info.git_dir}/.gitreview"],
        recursive: true,
        silent: true,});
    return callback err if err?
    return callback null


reset_and_checkout_to = (info, callback) ->
    p "reset_and_checkout_to called with '#{info.info}'"
    p repo.checkout info.to_branch , (err,head) ->
        p repo.reset "HEAD" , { hard: true } , (err) ->
            return callback err if err?
            return callback null



commit_new_gitreview = (info, callback) ->
    p "commit_new_gitreview called with '#{info.info}'"
    p repo.add "#{info.git_dir}/.gitreview" , (err) ->
        p repo.commit "Owner: #{info.owner} ;  From: #{info.from_branch} ", (err) ->
            return callback err if err?
            return callback null


publish_commits_to_gerrit = (info, callback) ->
    #    "C:\Program Files (x86)\Git\bin\git.exe" push -u --progress "origin" HEAD:refs/publish/feat_zhaoli
    p repo.remote_push "origin","HEAD:refs/publish/#{info.to_branch}" , (err) ->
        return callback err if err?
        return callback null



if false
    fetch_remote info, (err) ->
        clean_repo info , (err) ->
            reset_and_checkout_to info, (err) ->
                update_gitreview info, (err) ->
                    commit_new_gitreview info, (err) ->
                        publish_commits_to_gerrit info, (err) ->
                            return err if err?


if true
    info.to_branch = "master"
    reset_and_checkout_to info, (err) ->
        clean_local_branches (err) ->
            return err if err?

