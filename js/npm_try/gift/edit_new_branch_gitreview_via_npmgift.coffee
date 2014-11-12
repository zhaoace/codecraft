git = require "gift"
replace = require "replace"


# utils
{exec} = require 'child_process'
p = (x) -> console.log x
s = {}  #results
# utils
git_dir = 'C:/git/leandi/cvom_html'
repo = git git_dir

to_branch = {}
to_branch.to_branch = "feat_zhaoli"

fetch_remote = (sth) ->
    p "fetch_remote start"
    repo.remote_fetch "origin" , (err, msg) ->
        throw err if err
        reset_and_checkout_to_master sth

    return p "fetch_remote done"

reset_and_checkout_to_master = (sth) ->
    p "reset_and_checkout_to_master start"
    repo.add "*" , (err) ->
        repo.reset "HEAD" , { hard: true } , (err) ->
            repo.checkout "master", (err,head) ->
                repo.reset "HEAD" , { hard: true } , (err) ->
                    clean_local_branches sth
                    update_gitreview sth.to_branch
    return p "reset_and_checkout_to_master done"


clean_local_branches = (sth) ->
    p "clean_local_branches start"
    repo.branches (err,branches) ->
        for branch in branches
            if branch.name != 'master'
                repo.delete_branch branch.name , (err, msg) ->
                    throw err if err?
    return p "clean_local_branches done."


update_gitreview = (to_branch_name) ->
    p "update_gitreview start"
    replace({
        regex: "defaultbranch=.*",
        replacement: "defaultbranch=#{to_branch_name}",
        paths: ["#{git_dir}/.gitreview"],
        recursive: true,
        silent: true,});
    return p "update_gitreview done."


fetch_remote to_branch