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
package org.apache.royale.html.elements
{
    COMPILE::JS
    {
        import org.apache.royale.core.WrappedHTMLElement;            
    }
	import org.apache.royale.html.NodeElementBase;
	import org.apache.royale.html.TextNodeContainerBase;

	/**
	 *  The Div class represents an HTML <div> element
     *  
	 *  
     *  @toplevel
	 *  @langversion 3.0
	 *  @playerversion Flash 10.2
	 *  @playerversion AIR 2.6
	 *  @productversion Royale 0.0
	 */
	public class Div extends TextNodeContainerBase
	{
		/**
		 *  constructor.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.0
		 */
		public function Div()
		{
			super();
		}

		private var _html:String = "";

        /**
         *  Sets the HTML of the Div
         *
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion Royale 0.9
		 */
		public function get html():String
		{
			return _html;
		}
		public function set html(value:String):void
		{
			_html = value;

			COMPILE::JS
			{
				element.innerHTML = value;
			}
		}

    }
}