
#  Welcome to the Blue Button Implementation Guide Repository

### Updating

	1. Make the desired changes to the profiles/extensions/etc. in either the resources
		folder (to change the structure) or the pages/_includes folder (to add documentation).
	2. For each file changed, copy and replace the new version to the AWS server setup with the IG Publisher (org.hl7.fhir.igpublisher.jar).
	3. Run the IG Publisher.
	4. Copy the files from the output folder which should have been updated based on the changes (i.e. if you
		made changes to the pde-claim profile, pull over the pages associated to pde-claim).
	5. A find/replace must be performed to ensure the links are still working. Make the following changes:
		http://hl7.org/fhir  -> https://bluebutton.cms.gov/assets/ig
		StructureDefinition/ -> StructureDefinition-
		ValueSet/			 -> ValueSet-
		CodeSystem/			 -> CodeSystem-
		This change is necessary right now as the IG Publisher only seems to work if the links are currently built
		to point to hl7.org/fhir. Perhaps with a little tweaking this could be changed to automatically build the
		links to point to bluebutton.cms.gov in the future.
	6. Commit/push the changes.

---
