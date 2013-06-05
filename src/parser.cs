using System;
using System.IO;
using ICSharpCode.NRefactory;
using ICSharpCode.NRefactory.CSharp;
using Mono.Cecil;

namespace Coutillier {
	class Parser {
		public static void Main(string[] args){
			if(args.Length != 1){
				Console.WriteLine("Must provide name of a single .cs file to parse.");
				Environment.Exit(1);
			}
			string programCode = System.IO.File.ReadAllText(args[0]);
			CSharpParser parser = new CSharpParser();
			SyntaxTree syntaxTree = parser.Parse(programCode);
			int k = 0;
			foreach(AstNode element in syntaxTree.Children){
				k++;
				Console.WriteLine(element.ToString()+":"+k);
			}
		}
	}
}
