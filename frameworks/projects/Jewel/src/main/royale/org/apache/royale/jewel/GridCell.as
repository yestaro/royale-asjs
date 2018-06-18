////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package org.apache.royale.jewel
{
	import org.apache.royale.jewel.beads.layouts.GridCellLayout;
	import org.apache.royale.utils.StringUtil;

	/**
	 *  The GridCell class is the inmediate container in a Grid Layout
	 *  to host grid cell content.
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10.2
	 *  @playerversion AIR 2.6
	 *  @productversion Royale 0.9.3
	 */
	public class GridCell extends Group
	{
		/**
		 *  constructor.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.3
		 */
		public function GridCell()
		{
			super();

            typeNames = "jewel " + GridCellLayout.LAYOUT_TYPE_NAMES;

			layout = new GridCellLayout();
			addBead(layout);
		}

		protected var layout:GridCellLayout;

		/**
		 *  The X Number for "desktop-col-X-Y" effect selector.
		 *  Sets the desktop numerator for the X/Y fraction that indicates the cell's size in
		 * 	desktop screen. Needs to be set in conjunction with desktop denominator
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.3
		 */
        public function get desktopNumerator():Number
        {
            return layout.desktopNumerator;
        }

		public function set desktopNumerator(value:Number):void
        {
			COMPILE::JS
            {
				setFractionForScreen(GridCellLayout.DESKTOP, value, layout.desktopDenominator);
			
				if (parent)
                	setClassName(computeFinalClassNames()); 
			}

			layout.desktopNumerator = value;
		}

		/**
		 *  The Y Number for "desktop-col-X-Y" effect selector.
		 *  Sets the desktop denominator for the X/Y fraction that indicates the cell's size in
		 *  desktop screen. Needs to be set in conjunction with desktop denominator
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.3
		 */
        public function get desktopDenominator():Number
        {
            return layout.desktopDenominator;
        }

		public function set desktopDenominator(value:Number):void
        {
			COMPILE::JS
            {
				setFractionForScreen(GridCellLayout.DESKTOP, layout.desktopNumerator, value);
			
				if (parent)
                	setClassName(computeFinalClassNames()); 
			}

			layout.desktopDenominator = value;
		}

		/**
		 *  The X Number for "tablet-col-X-Y" effect selector.
		 *  Sets the tablet numerator for the X/Y fraction that indicates the cell's size in
		 * 	tablet screen. Needs to be set in conjunction with tablet denominator
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.3
		 */
        public function get tabletNumerator():Number
        {
            return layout.tabletNumerator;
        }

		public function set tabletNumerator(value:Number):void
        {
			COMPILE::JS
            {
				setFractionForScreen(GridCellLayout.TABLET, value, layout.tabletDenominator);
			
				if (parent)
                	setClassName(computeFinalClassNames()); 
			}

			layout.tabletNumerator = value;
		}

		/**
		 *  The Y Number for "tablet-col-X-Y" effect selector.
		 *  Sets the tablet denominator for the X/Y fraction that indicates the cell's size in
		 *  tablet screen. Needs to be set in conjunction with tablet denominator
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.3
		 */
        public function get tabletDenominator():Number
        {
            return layout.tabletDenominator;
        }

		public function set tabletDenominator(value:Number):void
        {
			COMPILE::JS
            {
				setFractionForScreen(GridCellLayout.TABLET, layout.tabletNumerator, value);
			
				if (parent)
                	setClassName(computeFinalClassNames()); 
			}

			layout.tabletDenominator = value;
		}

		/**
		 *  The X Number for "phone-col-X-Y" effect selector.
		 *  Sets the phone numerator for the X/Y fraction that indicates the cell's size in
		 * 	phone screen. Needs to be set in conjunction with phone denominator
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.3
		 */
        public function get phoneNumerator():Number
        {
            return layout.phoneNumerator;
        }

		public function set phoneNumerator(value:Number):void
        {
			COMPILE::JS
            {
				setFractionForScreen(GridCellLayout.PHONE, value, layout.phoneDenominator);
			
				if (parent)
                	setClassName(computeFinalClassNames()); 
			}

			layout.phoneNumerator = value;
		}

		/**
		 *  The Y Number for "phone-col-X-Y" effect selector.
		 *  Sets the phone denominator for the X/Y fraction that indicates the cell's size in
		 *  phone screen. Needs to be set in conjunction with phone denominator
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.3
		 */
        public function get phoneDenominator():Number
        {
            return layout.phoneDenominator;
        }

		public function set phoneDenominator(value:Number):void
        {
			COMPILE::JS
            {
				setFractionForScreen(GridCellLayout.PHONE, layout.phoneNumerator, value);
			
				if (parent)
                	setClassName(computeFinalClassNames()); 
			}

			layout.phoneDenominator = value;
		}

		COMPILE::JS
		private function setFractionForScreen(screen:String, num:Number, den:Number):void
		{
			if(num && den)
			{
				if (num <= 0 || num > GridCellLayout.MAX_COLUMNS)
					throw new Error(screen + " numerator must be between 1 and " + GridCellLayout.MAX_COLUMNS);
				if (den <= 0 || den > GridCellLayout.MAX_COLUMNS)
					throw new Error(screen + " denominator must be between 1 and " + GridCellLayout.MAX_COLUMNS);
				
				typeNames = StringUtil.removeWord(typeNames, " " + screen + "-col-" + layout.desktopNumerator + "-" + layout.desktopDenominator);
				typeNames += " " + screen + "-col-" + num + "-" + den;
			}
        }

		/**
		 *  Assigns variable gap to grid from 1 to 20
		 *  Activate "gap-Xdp" effect selector to set a numeric gap 
		 *  between grid cells
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.3
		 */
        // public function get gap():Number
        // {
        //     return layout.gap;
        // }

        // public function set gap(value:Number):void
        // {
		// 	typeNames = StringUtil.removeWord(typeNames, " gap-" + layout.gap + "dp");
		// 	if(value != 0)
		// 		typeNames += " gap-" + value + "dp";

		// 	COMPILE::JS
        //     {
		// 		if (parent)
        //         	setClassName(computeFinalClassNames()); 
		// 	}

		// 	layout.gap = value;
        // }
	}
}