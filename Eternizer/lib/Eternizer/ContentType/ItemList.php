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
 * Generic item list content plugin implementation class
 */
class Eternizer_ContentType_ItemList extends Eternizer_ContentType_Base_ItemList
{
    // feel free to extend the content type here
}

function Eternizer_Api_ContentTypes_itemlist($args)
{
    return new Eternizer_Api_ContentTypes_itemListPlugin();
}
