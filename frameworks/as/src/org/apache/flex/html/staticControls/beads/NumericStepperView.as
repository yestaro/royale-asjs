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
package org.apache.flex.html.staticControls.beads
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	import org.apache.flex.core.IBeadView;
	import org.apache.flex.core.ILayoutParent;
	import org.apache.flex.core.IParent;
	import org.apache.flex.core.IRangeModel;
	import org.apache.flex.core.IStrand;
	import org.apache.flex.core.UIBase;
	import org.apache.flex.createjs.staticControls.Label;
	import org.apache.flex.events.Event;
	import org.apache.flex.events.IEventDispatcher;
	import org.apache.flex.html.staticControls.Spinner;
	import org.apache.flex.html.staticControls.TextInput;
	import org.apache.flex.html.staticControls.beads.layouts.NonVirtualHorizontalLayout;
	import org.apache.flex.html.staticControls.supportClasses.Border;
	import org.apache.flex.html.staticControls.supportClasses.ScrollBar;
	
	public class NumericStepperView implements IBeadView, ILayoutParent
	{
		public function NumericStepperView()
		{
		}
		
		private var _strand:IStrand;
		
		private var label:Label;
		private var input:TextInput;
		private var spinner:Spinner;
		
		public function set strand(value:IStrand):void
		{
			_strand = value;
			
			// add a horizontal layout bead
			value.addBead(new NonVirtualHorizontalLayout());
            
			// add an input field
			input = new TextInput();
			IParent(value).addElement(input);
			
			// add a spinner
			spinner = new Spinner();
			spinner.addBead( UIBase(value).model );
			IParent(value).addElement(spinner);
			spinner.width = 17;
			input.height = spinner.height; // should be spinner.height = input.height but the spinner buttons won't get small enough
			
			// listen for changes to the text input field which will reset the
			// value. ideally, we should either set the input to accept only
			// numeric values or, barring that, reject non-numeric entries. we
			// cannot do that right now however.
			input.model.addEventListener("textChange",inputChangeHandler);
			
			// listen for change events on the spinner so the value can be updated as
			// as resizing the component
			spinner.addEventListener("valueChanged",spinnerValueChanged);
			IEventDispatcher(value).addEventListener("widthChanged",sizeChangeHandler);
			IEventDispatcher(value).addEventListener("heightChanged",sizeChangeHandler);
			
			// listen for changes to the model itself and update the UI accordingly
			IEventDispatcher(UIBase(value).model).addEventListener("valueChange",modelChangeHandler);
			IEventDispatcher(UIBase(value).model).addEventListener("minimumChange",modelChangeHandler);
			IEventDispatcher(UIBase(value).model).addEventListener("maximumChange",modelChangeHandler);
			IEventDispatcher(UIBase(value).model).addEventListener("stepSizeChange",modelChangeHandler);
			IEventDispatcher(UIBase(value).model).addEventListener("snapIntervalChange",modelChangeHandler);
			
			input.text = String(spinner.value);
			
			// set a default size which will trigger the sizeChangeHandler
			var minWidth:Number = Math.max(50+spinner.width,UIBase(value).width);
			
			UIBase(value).width = minWidth;
			UIBase(value).height = spinner.height;
		}
		
		private function sizeChangeHandler(event:Event) : void
		{
			input.x = 2;
			input.y = (UIBase(_strand).height - input.height)/2;
			input.width = UIBase(_strand).width-spinner.width-2;
			spinner.x = input.width+2;
			spinner.y = 0;
		}
		
		private function spinnerValueChanged(event:Event) : void
		{
			input.text = String(spinner.value);
			
			var newEvent:Event = new Event(event.type,event.bubbles);
			IEventDispatcher(_strand).dispatchEvent(newEvent);
		}
		
		private function inputChangeHandler(event:Event) : void
		{
			var newValue:Number = Number(input.text);

			if( !isNaN(newValue) ) {
				spinner.value = newValue;
			}
			else {
				input.text = String(spinner.value);
			}
		}
		
		private function modelChangeHandler( event:Event ) : void
		{
			var n:Number = IRangeModel(UIBase(_strand).model).value;
			input.text = String(IRangeModel(UIBase(_strand).model).value);
		}
		
		public function get contentView():DisplayObjectContainer
		{
			return _strand as DisplayObjectContainer;
		}
		
		public function get border():Border
		{
			return null;
		}
		
		public function get vScrollBar():ScrollBar
		{
			return null;
		}
		
		public function get hScrollBar():ScrollBar
		{
			return null;
		}
		
		public function get resizableView():DisplayObject
		{
			return _strand as DisplayObject;
		}
	}
}