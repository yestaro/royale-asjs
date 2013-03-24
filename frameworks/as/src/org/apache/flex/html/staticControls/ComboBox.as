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
package org.apache.flex.html.staticControls
{
	import org.apache.flex.core.IBead;
	import org.apache.flex.core.IComboBoxBead;
	import org.apache.flex.core.IComboBoxModel;
	import org.apache.flex.core.IInitSkin;
	import org.apache.flex.core.UIBase;
	import org.apache.flex.core.ValuesManager;
	
	public class ComboBox extends UIBase implements IInitSkin
	{
		public function ComboBox()
		{
			super();
		}
		
		public function get dataProvider():Object
		{
			return IComboBoxModel(model).dataProvider;
		}
		public function set dataProvider(value:Object):void
		{
			IComboBoxModel(model).dataProvider = value;
		}
		
		public function get selectedIndex():int
		{
			return IComboBoxModel(model).selectedIndex;
		}
		public function set selectedIndex(value:int):void
		{
			IComboBoxModel(model).selectedIndex = value;
		}
		
		override public function initModel():void
		{
			if (getBeadByType(IComboBoxModel) == null)
				addBead(new (ValuesManager.valuesImpl.getValue(this, "iComboBoxModel")) as IBead);
		}
		
		public function initSkin():void
		{
			if (getBeadByType(IComboBoxBead) == null) {
				var cb:IComboBoxBead = new (ValuesManager.valuesImpl.getValue(this, "iComboBoxBead")) as IComboBoxBead;
				addBead(cb);
			}
		}
	}
}