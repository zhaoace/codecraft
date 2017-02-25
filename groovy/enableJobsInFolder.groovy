import com.cloudbees.hudson.plugins.folder.AbstractFolder
import hudson.model.AbstractProject
import jenkins.model.Jenkins

// I want to disable jobs
def enbaleJobs = { println "Enabling '${it.fullName}'"; it.enable() }

//Function to retrieve all buildable Project in a specific Folder
def doAllItemsInFolder(folderName, closure) {
    AbstractFolder folder = Jenkins.instance.getAllItems(AbstractFolder.class)
            .find {folder -> folderName == folder.fullName };

    folder.getAllJobs()
            .findAll {job -> job instanceof AbstractProject}
            .findAll {job -> job.isDisabled()}
            .each {closure(it)};
}

folderFullName='Testcube/generic_jobs_testcube';
doAllItemsInFolder("${folderFullName}", enbaleJobs);
