<?php
/**
 * Eternizer.
 *
 * @copyright Michael Ueberschaer
 * @license http://www.gnu.org/licenses/lgpl.html GNU Lesser General Public License
 * @package Eternizer
 * @author Michael Ueberschaer <kontakt@webdesign-in-bremen.com>.
 * @link http://www.webdesign-in-bremen.com
 * @link http://zikula.org
 * @version Generated by ModuleStudio 0.5.3 (http://modulestudio.de) at Fri Dec 30 18:01:17 CET 2011.
 */

/**
 * Ajax controller class.
 */
class Eternizer_Controller_Base_Ajax extends Zikula_Controller_AbstractAjax
{

    /**
     * This method is the default function, and is called whenever the
     * module's Ajax area is called without defining arguments.
     *
     * @return mixed Output.
     */
    public function main($args)
    {
        // DEBUG: permission check aspect starts
        $this->throwForbiddenUnless(SecurityUtil::checkPermission('Eternizer::', '::', ACCESS_OVERVIEW));
        // DEBUG: permission check aspect ends

    }

}
