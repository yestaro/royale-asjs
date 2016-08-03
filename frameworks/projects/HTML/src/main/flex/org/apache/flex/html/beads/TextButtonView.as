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
package org.apache.flex.html.beads
{
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.SimpleButton;
	import flash.text.TextFieldType;
	
	import org.apache.flex.core.BeadViewBase;
	import org.apache.flex.core.CSSTextField;
	import org.apache.flex.core.IBeadView;
	import org.apache.flex.core.IChild;
	import org.apache.flex.core.IStrand;
	import org.apache.flex.core.ITextModel;
	import org.apache.flex.events.Event;
	import org.apache.flex.events.IEventDispatcher;
	import org.apache.flex.html.Button;

    /**
     *  The TextButtonView class is the default view for
     *  the org.apache.flex.html.TextButton class.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 10.2
     *  @playerversion AIR 2.6
     *  @productversion FlexJS 0.0
     */
	public class TextButtonView extends BeadViewBase implements IBeadView
	{
        /**
         *  Constructor.
         *  
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion FlexJS 0.0
         */
		public function TextButtonView()
		{
			upTextField = new CSSTextField();
			downTextField = new CSSTextField();
			overTextField = new CSSTextField();
			upTextField.border = true;
			downTextField.border = true;
			overTextField.border = true;
			upTextField.background = true;
			downTextField.background = true;
			overTextField.background = true;
			upTextField.borderColor = 0;
			downTextField.borderColor = 0;
			overTextField.borderColor = 0;
			upTextField.backgroundColor = 0xCCCCCC;
			downTextField.backgroundColor = 0x808080;
			overTextField.backgroundColor = 0xFFCCCC;
			upTextField.selectable = false;
			upTextField.type = TextFieldType.DYNAMIC;
			downTextField.selectable = false;
			downTextField.type = TextFieldType.DYNAMIC;
			overTextField.selectable = false;
			overTextField.type = TextFieldType.DYNAMIC;
			upTextField.autoSize = "left";
			downTextField.autoSize = "left";
			overTextField.autoSize = "left";

		}
		
		private var textModel:ITextModel;
		
		private var shape:Shape;
		
        /**
         *  @copy org.apache.flex.core.IBead#strand
         *  
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion FlexJS 0.0
         */
		override public function set strand(value:IStrand):void
		{
			super.strand = value;
			var button:SimpleButton = Button(value).$button;
			textModel = value.getBeadByType(ITextModel) as ITextModel;
			textModel.addEventListener("textChange", textChangeHandler);
			textModel.addEventListener("htmlChange", htmlChangeHandler);
			shape = new Shape();
			shape.graphics.beginFill(0xCCCCCC);
			shape.graphics.drawRect(0, 0, 10, 10);
			shape.graphics.endFill();
			button.upState = upTextField;
			button.downState = downTextField;
			button.overState = overTextField;
			button.hitTestState = shape;
			upTextField.styleParent = value;
			downTextField.styleParent = value;
			overTextField.styleParent = value;
			if (textModel.text !== null)
				text = textModel.text;
			if (textModel.html !== null)
				html = textModel.html;
			
			IEventDispatcher(_strand).addEventListener("widthChanged",sizeChangeHandler);
			IEventDispatcher(_strand).addEventListener("heightChanged",sizeChangeHandler);
		}
		        
		private function textChangeHandler(event:Event):void
		{
			text = textModel.text;
		}
		
		private function htmlChangeHandler(event:Event):void
		{
			html = textModel.html;
		}
		
		private function sizeChangeHandler(event:Event):void
		{
            var button:SimpleButton = IChild(_strand).$displayObject as SimpleButton;
			upTextField.width = downTextField.width = overTextField.width = button.width;
			upTextField.height= downTextField.height= overTextField.height= button.height;
		}
		
        /**
         *  The CSSTextField in the up state
         *  
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion FlexJS 0.0
         */
		public var upTextField:CSSTextField;

        /**
         *  The CSSTextField in the down state
         *  
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion FlexJS 0.0
         */
		public var downTextField:CSSTextField;

        /**
         *  The CSSTextField in the over state
         *  
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion FlexJS 0.0
         */
		public var overTextField:CSSTextField;
		
        /**
         *  @copy org.apache.flex.html.core.ITextModel#text
         *  
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion FlexJS 0.0
         */
		public function get text():String
		{
			return upTextField.text;
		}
        
        /**
         *  @private
         */
		public function set text(value:String):void
		{
			upTextField.text = value;
			downTextField.text = value;
			overTextField.text = value;
			shape.graphics.clear();
			shape.graphics.beginFill(0xCCCCCC);
			shape.graphics.drawRect(0, 0, upTextField.textWidth, upTextField.textHeight);
			shape.graphics.endFill();
			
		}
		
        /**
         *  @copy org.apache.flex.html.core.ITextModel#text
         *  
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion FlexJS 0.0
         */
		public function get html():String
		{
			return upTextField.htmlText;
		}
		
        /**
         *  @private
         */
		public function set html(value:String):void
		{
			upTextField.htmlText = value;
			downTextField.htmlText = value;
			overTextField.htmlText = value;
		}
	}
}
