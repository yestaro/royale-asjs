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
package org.apache.royale.html
{
	import org.apache.royale.core.IBead;
	import org.apache.royale.core.IDateChooserModel;
	import org.apache.royale.core.IFormatter;
	import org.apache.royale.core.UIBase;
	import org.apache.royale.core.ValuesManager;
	import org.apache.royale.events.Event;
	import org.apache.royale.utils.loadBeadFromValuesManager;
	
	/**
	 * The change event is dispatched when the selectedDate is changed.
	 */
	[Event(name="change", type="org.apache.royale.events.Event")]
	
	/**
	 * The DateField class provides an input field where a date can be entered
	 * and a pop-up calendar control for picking a date as an alternative to
	 * the text field.
	 *  
     *  @toplevel
	 *  @langversion 3.0
	 *  @playerversion Flash 10.2
	 *  @playerversion AIR 2.6
	 *  @productversion Royale 0.0
	 */
	public class DateField extends UIBase
	{
		/**
		 *  constructor.
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.0
		 */
		public function DateField()
		{
			super();
			
			typeNames = "DateField";
		}
		
		/**
		 * The method called when added to a parent. The DateField class uses
		 * this opportunity to install additional beads.
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.0
		 */
		override public function addedToParent():void
		{
			super.addedToParent();
			loadBeadFromValuesManager(IFormatter, "IFormatter", this);

			dispatchEvent(new Event("initComplete"));
		}

		[Bindable("selectedDateChanged")]
		/**
		 *  The currently selected date (or null if no date has been selected).
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.0
		 */
		public function get selectedDate():Date
		{
			return IDateChooserModel(model).selectedDate;
		}
		public function set selectedDate(value:Date):void
		{
			IDateChooserModel(model).selectedDate = value;
		}
	}
}
