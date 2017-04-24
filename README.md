# TeXDist.pkg

TeXDist installer for legacy Macs

<img src="media/installer/background.jpg" align="center" width="310">

This documentation explains how the TeXDist package is made.

## Contents

List of files:
  * `media/`
    * `installer/` – files used by installer
      * `background.jpg`
      * `License.rtf`
      * `ReadMe.rtf`
      * `Welcome.rtf`
    * `Choosing a TeX Distribution.rtf`
    * `Description.rtf`
  * `scripts`
  * `TeXDistBuild.pmdoc`
    * `01library-contents.xml`
    * `01library.xml`
    * `index.xml`
  * `buildPackage.sh`
  * `signPackage.sh`

## Updating for a New Year

To update the  package for a new year make sure to replace the year in the following files:

* `media/Choosing a TeX Distribution.rtf`
* `media/Description.rtf`
* `media/installer/ReadMe.rtf`
* `media/installer/Welcome.rtf`
* `scripts/postinstall`
* `TeXDistBuild.pmdoc/01library.xml`
* `TeXDistBuild.pmdoc/index.xml`

## Creating the  Package

Issue the command
```
sudo ./buildPackage.sh
```
to build the temporary `build` folder, containing `/Library/TeX`.

## Building TeXDist

Open `TeXDistBuild.pmdoc`, the Packagemaker project file, using the GUI interface.

* Click the top item on the left. The right side will change to a view with three tabs. First select the Configuration tab. Edit so

    | Option                  | Value |
    | ---                     | --- |
    | **Title**               | TeXDist |
    | **User Sees**           | Easy Install Only |
    | **Install Destination** | System volume |
    | **Certificate**         | Leave this blank. (You might think that putting a certificate name here would correctly sign the package, but experiments show that it does not. The package needs to be signed after it is constructed.) |
    | **Description**         | *empty* |

* The Requirements and Actions tab entries for the top item can be left blank
* Click the entry TeXDist in the Contents section on the left. The right side will change to a view with two tabs.
  Select the Configuration tab. Edit so:

    | Option            | Value                |
    | ---               | ---                  |
    | **Choice Name**   | `TeXDist`            |
    | **Identifier**    | `choice1`            |
    | **Initial State** | Selected and Enabled |
    | **Destination**   | *leave blank*        |
    | **Tooltip**       | *leave blank*        |
    | **Description**   | *leave blank*        |

* The Requirements tab entries for this contents item can be left blank
* Open the TeXDiste  entry in the bottom left column. This item should show a `Library' directory, obtained by dragging `build/Library` to the left column. The right side will change to a view with four tabs.
  It is not necessary to edit the items under the Contents or Components tabs. The items under the Configuration tab should be edited as follows:

    | Option                           | Value |
    | ---                              | ---   |
    | **Install**                      | `build/Library` (The item on the right should have `Relative To Project` selected) |
    | **Destination**                  | `/Library` (The item on the right should have `Relative To Project` selected) |
    | **Allow custom location**        | *don't check* |
    | **Patch**                        | No patch root selected |
    | **Package Identifier**           | `org.tug.texdist2017` |
    | **Package Version**              | 1.0 |
    | **Restart Action**               | None |
    | **Require admin authentication** | *check* |
    | **PackageLocation**              | Self-Contained |

  The items under the Scripts tab should be edited to read

    | Option                | Value |
    | ---                   | ---   |
    | **Scripts directory** | `scripts` (The item on the right should have `Relative To Project` selected) |
    | **Preinstall**        | *leave blank* |
    | **Postinstall**       | `scripts/postinstall` (The item on the right should have `Relative To Project` selected) |

## Signing

Sign the package using the single command
```
./signPackage.sh
```
