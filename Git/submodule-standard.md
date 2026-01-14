# Fixing GitHub "Submodule" Folders: Converting Gitlinks to Standard Directories**

---

## **Problem Overview**

When you copy a folder that contains its own `.git` history into a new repository, GitHub treats it as a **submodule** (or "gitlink"). This causes the folder to appear with a white arrow icon and prevents the files inside from being viewable or tracked by the main repository.

In the [express-t2s-collection](https://github.com/Here2ServeU/express-t2s-collection) repository, the [aiops-demo-t2s](https://github.com/Here2ServeU/express-t2s-collection/tree/main/aiops-demo-t2s) folder initially encountered this issue before being converted into a standard directory.

---

## **The Solution**

Follow these steps in your terminal to convert a submodule into a regular folder:

### **1. Remove the Submodule Tracking**

Remove the folder from Git's index without deleting your local files:

```bash
git rm --cached aiops-demo-t2s

```

### **2. Delete Nested Git Metadata**

Navigate into the folder and delete the hidden `.git` directory. This is the step that "flattens" the folder so it can be tracked normally:

```bash
cd aiops-demo-t2s
rm -rf .git
cd ..

```

### **3. Add and Push as a Regular Folder**

Now that the internal Git history is gone, add the folder back to your main repository and push the changes:

```bash
git add aiops-demo-t2s
git commit -m "Convert aiops-demo-t2s from submodule to regular folder"
git push origin main

```

---

## **Verification**

Once updated, the folder icon for [aiops-demo-t2s](https://github.com/Here2ServeU/express-t2s-collection/tree/main/aiops-demo-t2s) will match the standard blue folder style of other directories like [express-t2s-app-v1](https://github.com/Here2ServeU/express-t2s-collection/tree/main/express-t2s-app-v1). You will now be able to click through and see all files within that folder on GitHub.
